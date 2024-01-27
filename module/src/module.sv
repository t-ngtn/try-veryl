// module definition
module module_ModuleA #(
    parameter  int unsigned ParamA = 10,
    localparam int unsigned ParamB = 10 // trailing comma is allowed
) (
    input  logic              i_clk         ,
    input  logic              i_rst         ,
    input  logic              i_sel         ,
    input  logic [ParamA-1:0] i_data [0:2-1], // `[]` means unpacked array in SystemVerilog
    output logic [ParamA-1:0] o_data         // `<>` means packed array in SystemVerilog
);
    // localparam declaration
    //   `parameter` is not allowed in module
    localparam int unsigned ParamC = 10;

    // variable declaration
    logic [ParamA-1:0] r_data0;
    logic [ParamA-1:0] r_data1;

    // always_ff statement with reset
    //   `always_ff` can take a mandatory clock and a optional reset
    //   `if_reset` means `if (i_rst)`. This conceals reset porality
    //   `()` of `if` is not required
    //   `=` in `always_ff` is non-blocking assignment
    always_ff @ (posedge i_clk, negedge i_rst) begin
        if (!i_rst) begin
            r_data0 <= 0;
        end else if (i_sel) begin
            r_data0 <= i_data[0];
        end else begin
            r_data0 <= i_data[1];
        end
    end

    // always_ff statement without reset
    always_ff @ (posedge i_clk) begin
        r_data1 <= r_data0;
    end

    assign o_data = r_data1;
endmodule
