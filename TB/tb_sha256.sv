`timescale 1ns/1ns

module tb_sha256();

reg clk = 1'b1;   always #5 clk = ~clk; // 100MHz

reg          tvalid = 1'b0;
wire         tready;
reg          tlast  = 1'b0;
reg  [ 31:0] tid    = '0;
reg  [  7:0] tdata  = '0;

wire         ovalid;
wire [ 31:0] oid;
wire [ 60:0] olen;
wire [255:0] osha;

sha256 sha256_i(
    .rst      ( 1'b0   ),
    .clk      ( clk    ),
    .tvalid   ( tvalid ),
    .tready   ( tready ),
    .tlast    ( tlast  ),
    .tid      ( tid    ),
    .tdata    ( tdata  ),
    .ovalid   ( ovalid ),
    .oid      ( oid    ),
    .olen     ( olen   ),
    .osha     ( osha   )
);

always @ (posedge clk)
    if(ovalid)
        $display("id=%0d   len=%0d   sha256=%064x", oid, olen, osha);

task automatic delay(input int cycles);
    for(int i=0;i<cycles;i++) begin
        @(posedge clk);
        {tvalid,tlast,tid,tdata} <= '0;
    end
endtask

task automatic push_file(input int id, input int fp);
    automatic int rbytel=-1, rbyte=-1, firstbyte=1;
    if(fp==0) begin
        $write("*** error: could not open file.\n");
        $stop;
    end
    if($feof(fp)) begin
        $write("*** error: file is empty.\n");
        $stop;
    end
    while(~tready) begin
        {tvalid,tlast,tid,tdata} <= '0;
        @(posedge clk);
    end
    while(1) begin
        while($random()%5>0) begin
            {tvalid,tlast,tid,tdata} <= '0;
            @(posedge clk);
        end
        rbytel= rbyte;
        rbyte = $fgetc(fp);
        if(firstbyte & (rbytel!=-1)) begin
            firstbyte = 0;
            tid <= id;
        end else
            tid <= '0;
        tvalid <= (rbytel!=-1);
        tlast  <= (rbyte==-1);
        tdata  <= (rbytel!=-1) ? rbytel : 8'h0;
        @(posedge clk);
        if(rbyte==-1) break;
    end
    {tvalid,tlast,tid,tdata} <= '0;
    @(posedge clk);
    $fclose(fp);
endtask

initial begin
    delay(3);
    push_file(111, $fopen("test1.bin", "rb"));
    #push_file(111, $fopen("../data/test1.bin", "rb"));
    delay(200);
    $stop;
end

endmodule
