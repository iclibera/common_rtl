interface axi4_if
#(
parameter int ADDR_WIDTH = 32,  // Address width
parameter int DATA_WIDTH = 32   // Data width
)();
// Write Address Channel
logic [ADDR_WIDTH-1:0]     awaddr;  // Write address
logic [2:0]                awprot;  // Protection type
logic                      awvalid; // Write address valid
logic                      awready; // Write address ready

// Write Data Channel
logic [DATA_WIDTH-1:0]     wdata;   // Write data
logic [(DATA_WIDTH/8)-1:0] wstrb; // Write strobes (based on data width)
logic                      wvalid;  // Write valid
logic                      wready;  // Write ready

// Write Response Channel
logic [1:0]                bresp;   // Write response
logic                      bvalid;  // Write response valid
logic                      bready;  // Write response ready

// Read Address Channel
logic [ADDR_WIDTH-1:0]     araddr;  // Read address
logic [2:0]                arprot;  // Protection type
logic                      arvalid; // Read address valid
logic                      arready; // Read address ready

// Read Data Channel
logic [DATA_WIDTH-1:0]     rdata;   // Read data
logic [1:0]                rresp;   // Read response
logic                      rvalid;  // Read valid
logic                      rready;  // Read ready

// Manager modport (drive outgoing, sample incoming)
modport manager (
    output awaddr, awprot, awvalid, wdata, wstrb, wvalid, bready, araddr, arprot, arvalid, rready,
    input  awready, wready, bresp, bvalid, arready, rdata, rresp, rvalid
);

// Subordinate modport (drive incoming, sample outgoing)
modport subordinate (
  input  awaddr, awprot, awvalid, wdata, wstrb, wvalid, bready, araddr, arprot, arvalid, rready,
  output awready, wready, bresp, bvalid, arready, rdata, rresp, rvalid
);
endinterface