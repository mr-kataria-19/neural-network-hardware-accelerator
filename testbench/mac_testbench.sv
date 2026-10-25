module mac_testbench;

    logic clk = 0;
    logic rst;
    logic enable;
    logic signed [7:0] a, b;
    logic signed [31:0] acc;

    mac_unit dut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .a(a),
        .b(b),
        .acc(acc)
    );

    always #5 clk = ~clk;

    initial begin
        rst = 1;
        enable = 0;
        a = 0;
        b = 0;

        @(posedge clk);
        #1;
        rst = 0;

        a = 2; b = 3; enable = 1;
        @(posedge clk); #1;
        $display("A=%0d B=%0d ACC=%0d", a, b, acc);

        a = 4; b = 5;
        @(posedge clk); #1;
        $display("A=%0d B=%0d ACC=%0d", a, b, acc);

        a = 1; b = 7;
        @(posedge clk); #1;
        $display("A=%0d B=%0d ACC=%0d", a, b, acc);

        $finish;
    end

endmodule
