// パッケージ定義
package package_PackageA;
    localparam int unsigned ParamA = 1;
    localparam int unsigned ParamB = 1;

    function automatic logic [ParamA-1:0] FuncA(
        input logic [ParamA-1:0] a
    ) ;
        return a + 1;
    endfunction
endpackage

module package_ModuleA;
    logic [10-1:0] a ;
    assign a = package_PackageA::ParamA;
    logic [10-1:0] _b;
    assign _b = package_PackageA::FuncA(a);
endmodule
