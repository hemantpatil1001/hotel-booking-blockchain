pragma solidity >=0.4.21 <0.7.0;
 
contract Hotel{
 
    // One booking per address
    mapping (address => HotelBooking) bookings;
    string name;
    // An array to save available room list
    uint[] availableRoom = new uint[](16);
    // Hotelier as the contract creator
    address payable public hotelier;
    // All rooms cost 0.1 ETH
    uint constant roomPrice = 5000000000000000000;  
 
    constructor(string memory _name) public {
       name = _name;
       hotelier = msg.sender;
        for (uint i=0;i < availableRoom.length-1;i++){
                availableRoom[i] = 0;
        }
    }

    function getAllRooms() external view returns (uint[] memory){
        
        return availableRoom;
     
     }

    
    
    struct HotelBooking{
        uint8 roomId;
        bool isValidBooking;
        string visitorName;
        uint visitorAge;
        bool hasCheckedIn;
        bool calledFoodService;
    }
   
   // For hotelier to set available room according to room id
   function setAvailableRoom(uint8 _roomID) public {
        bool duplicate = false;
        for (uint8 i=0;i < availableRoom.length-1;i++){
            if (availableRoom[i] == _roomID){
                duplicate = true;
            }
        }
        require(msg.sender == hotelier, "Only the hotelier can set available rooms.");
        require(duplicate == false, "There are existing rooms available.");
        for (uint8 j=0;j < availableRoom.length-1;j++){
            if(availableRoom[j] == 0){
                availableRoom[j] = _roomID;
                break;
            }
        }
    }
    
    function removeAvailableRoom(uint8 _roomID) public {
        bool roomAvailable = false;
        // Search existing roomList
        for (uint i=0;i < availableRoom.length-1;i++){
            if (availableRoom[i] == _roomID){
                roomAvailable = true;
                availableRoom[i] = 0;
            }
        }
        require(roomAvailable == true, "There is no this type of room available.");
    }
    
    function checkAvailableRoom(uint8 _roomID) public view returns (bool){
        bool roomAvailable = false;
        for (uint i=0;i < availableRoom.length-1;i++){
            if (availableRoom[i] == _roomID){
                roomAvailable = true;
            }
        }
        if (roomAvailable == true){
            return true;
        }else{
            return false;
        }
    }
   
    function makeBooking(string memory _name, uint _age, uint8 _roomId) public payable returns (bool){
        require(bytes(_name).length > 0, "Name cannot be empty!");
        require(_age >= 18, "Visitor is underage!");
        require(msg.value <= roomPrice, "Sender does not have enough money!");
        require(bookings[msg.sender].visitorAge == 0, "Sender already has a booking");
        bookings[msg.sender].isValidBooking = true;
        bookings[msg.sender].visitorName = _name;
        bookings[msg.sender].visitorAge = _age;
        bookings[msg.sender].hasCheckedIn = false;
        bookings[msg.sender].roomId = _roomId;
        return true;
    }
    
    function cancelBooking(address payable client) public returns(bool){
        require(msg.sender == hotelier, "Only the hotelier can cancel bookings and refund money");
        require(bookings[client].hasCheckedIn == false, "Sender has already checked in, no refund!");
        bookings[msg.sender].isValidBooking = false;
        client.transfer(roomPrice);
        return true;
    }

    function checkIn() public returns(bool){
        require(bookings[msg.sender].isValidBooking == true, "Booking is not valid, cannot check in!");
        require(bookings[msg.sender].hasCheckedIn != true, "Sender has already checked in!");
        bookings[msg.sender].hasCheckedIn = true;
        return true;
    }
    
    function checkOut() public returns(bool){
        require(bookings[msg.sender].hasCheckedIn == true, "Sender has not checked in, cannot check out!");
        bookings[msg.sender].hasCheckedIn = false;
        return true;
    }
 
    function foodService() public returns(bool){
        require(bookings[msg.sender].hasCheckedIn == true, "Sender has not checked in, cannot call food service!");
        bookings[msg.sender].calledFoodService = true;
        return true;
    }
    
    function foodServiceComplete() public returns(bool){
        require(bookings[msg.sender].calledFoodService == true, "Sender has not ordered food service, cannot cancel it!");
        bookings[msg.sender].calledFoodService = false;
        return true;
    }
    
    function transferMoney() public payable returns (bool){
        require(msg.sender == hotelier, "Only the hotelier can receive the money");
        hotelier.transfer(address(this).balance);
    }
}