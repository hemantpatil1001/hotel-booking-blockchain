import React, { Component } from "react";
import Hotel from "./contracts/Hotel.json";
import getWeb3 from "./getWeb3";
import Table from 'react-bootstrap/Table'
import 'bootstrap/dist/css/bootstrap.min.css';
import "./App.css";



class App extends Component {
  state = { storageValue: 0, web3: null, accounts: null, contract: null, availableRooms: 0 , rooms : ["Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes",]};



  componentDidMount = async () => {

    try 
    {
      // Get network provider and web3 instance.
      const web3 = await getWeb3();

        // Use web3 to get the user's accounts.
      const accounts = await web3.eth.getAccounts();

        // Get the contract instance.
      const networkId = 5777
      const deployedNetwork = Hotel.networks[networkId];
      const instance = new web3.eth.Contract(Hotel.abi,deployedNetwork && deployedNetwork.address);

        // Set web3, accounts, and contract to the state, and then proceed with an
        // example of interacting with the contract's methods.
      this.setState({ web3, accounts, contract: instance });
    } 
    catch (error) 
    {
      // Catch any errors for any of the above operations.
      alert(
      `Failed to load web3, accounts, or contract. Check console for details.`,
      );
    console.error(error);
    };
  }

  bookRoom = async (roomId) => {
    const { accounts, contract,rooms, web3 } = this.state;
    console.log("inside bookRoom ", roomId);

    if(rooms[roomId] === "No")
    {
      console.log("room already booked")
    }
    else if( await contract.methods.checkAvailableRoom(roomId).send({from: accounts[0] }))
    {
      // await contract.methods.setAvailableRoom(roomId).send({from : accounts[0]});

      console.log("In Progress");
      await contract.methods.makeBooking("Hemant",35,roomId);
      web3.eth.sendTransaction({
        from: accounts[0],
        to: "0x7dBFE7C7F2ce06d7D914f3BB924EA327930a90C1",
        value: '5000000000000000000'
      }).then(function(receipt){
        console.log(receipt);
        });


      rooms[roomId] = "No"
      console.log(rooms);
      this.setState({rooms});
    }

  }





  render(){




    if (!this.state.web3) {
      return <div>Loading Web3, accounts, and contract...</div>;
    }


    return (





    
    <body display="grid">
      
    
      <h1 align = "center" classname = "header">
        Hotel Booking Dapp
      </h1>
      <h4 align = "center">
        Book Rooms Privately 
      </h4>



      <Table striped bordered hover size="sm">
      <thead>
      <tr>

        
        <th>Room No.</th>
        <th>Room Availability</th>
     
      </tr>
      </thead>
    
      <tbody>

        {this.state.rooms.map((roomAvailability, index) =>  {
          return (
            
            <tr key={index}  onClick={() => this.bookRoom(index)}>
              
              <td className="toggler">
                  {index+1}
              </td>

              <td>
                 {roomAvailability}
              </td>


            </tr>

              );
              
              })}
          
              </tbody>
        </Table>



    </body>




    );



  }
}
export default App;
