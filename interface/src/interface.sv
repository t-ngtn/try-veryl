// インターフェース定義
interface interface_InterfaceA #(
    parameter int unsigned ParamA = 1,
    parameter int unsigned ParamB = 1
);
    localparam int unsigned ParamC = 1;

    logic [ParamA-1:0] a;
    logic [ParamA-1:0] b;
    logic [ParamA-1:0] c;

    // modport 定義
    modport master (
        input  a,
        input  b,
        output c
    );

    modport slave (
        input  a,
        input  b,
        output c
    );
endinterface

module interface_ModuleA (
    input logic i_clk,
    input logic i_rst,
    // modport によるポート宣言
    interface_InterfaceA.master intf_a_mst,
    interface_InterfaceA.slave intf_a_slv
);
    // インターフェースのインスタンス
    interface_InterfaceA u_intf_a [0:10-1] ();
endmodule
