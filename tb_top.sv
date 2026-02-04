module tb_top();
    initial begin
        $display("Hello, SystemVerilog!");
        
    end

    initial begin
        fork
            // Call the reset generation task
            reset_generation(); 
        join_none
        // Call the clock generation task
        clock_generation();
        
    end

    task reset_generation();
        $display("Reset generation started.");
        #5ns;
        $display("Reset de-asserted after 5ns.");
    endtask

    task clock_generation();
        $display("Clock generation started.");
        forever begin
            #2ns;
            $display("Clock tick at time %0t", $time);
        end 
    endtask


    initial begin
        #20ns;
        $finish;
    end
    
endmodule 