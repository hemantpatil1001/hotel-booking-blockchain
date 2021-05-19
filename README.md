# hotel-booking-blockchain
This Application is a decentralized application implemented to perform hotel reservations privately using Blockchain technology.

## Aim of the project:
Blockchain, the foundation of the bitcoin and the future of the payment technology. The aim of the project ‘Hotel reservations using Blockchain’ is to understand and implement secure transactions with transparency between the customers and the business using Blockchain and cryptocurrency.

## Tools and languages:

**Backend**: Remix IDE for solidity programming, npm and truffle to compile and migrate.

**Frontend**: React, Truffle, Metamask, web3.js Library, Smart contract, Ganache.

## Use case Diagram:
The use case diagram is a representation of a user’s interaction with system that shows the relationship between the user and the different use cases in which the user is involved.

![Usecase Diagram](https://user-images.githubusercontent.com/41775443/113839176-7247e880-975d-11eb-8e4f-fd5517994df3.png)



## Who is user?
The user here is the customer who is using the blockchain transactions over traditional payments.

## Functions supported by the application
**View profile**: The client can open the site and experience profile
**User Login**: The user can enter his credentials and become an authenticated user. They are a security measure designed to prevent unauthorized access to confidential data
**Check room availability**: The approved user can experience the rooms left/consumed.
**Make Booking**: The user can make booking of an available room.
**Make Payment**: The user can finish the booking by causing secure installment and will to get an affirmation.
**Cancel Booking**: The client can drop the booking if a bit much and get the refund back.

The goal of the application is, the user can use an application that uses blockchain as a secure transaction medium to reserve a room in a hotel. The application via blockchain shows a real time status of rooms *left/occupied* in a particular location which helps the customer to know the availability without subjecting to fraudulent price surging created due to the status of the availability of the room.  Once the transaction is approved the user receives a confirmation receipt without subjecting any false acts.

## Implementation steps

Create a project using truffle 

      npm install truffle
     Truffle unbox react


The above command will create the following directory structure

![image](https://user-images.githubusercontent.com/41775443/113839545-c521a000-975d-11eb-9cb9-38f7130bfeae.png)

The client directory contains the frontend code 
Write solidity contract code and deploy it on ganache
Install Ganache and create a workspace
![image](https://user-images.githubusercontent.com/41775443/113839996-395c4380-975e-11eb-83d4-afd1901c9be4.png)


###Install Metamask chrome extension and link the private blockchain(ganashe) with metamask


### Write front end code. 
Use web3.js to integrate all the components (private blockchain, frontend application, metamask)


### How does it look?
The final output of the Customer UI is below:
![image](https://user-images.githubusercontent.com/41775443/113840925-357cf100-975f-11eb-8516-6d38b394af8b.png)

### Encountered Issues
Faced connectivity issues from Ganache, Truffle and React.
**Resolution**: By Setting the network in Metamask to custom blockchain created by Ganache, Metamask wallet is able to connect to the private block chain which we are going to use for developing our smart contract.
In our font end we are checking if the browser’s window object has Ethereum object in it. Using this Ethereum object we are able to instantiate our web3 instance.

Contract ABI & contract address had to be manually pasted in React application.
**Resolution**: To instantiate the contract object which is inside web3 instance, we have to provide our deployed smart contract’s address and contract’s abi (Application Binary Interface)
By reading the complete contract .json file we were able to provide the contract abi and contract address as arguments to instantiate the Contract object. Using this Contract object we were able to execute the Smart Contract’s functions which are deployed on our private block chain created by Ganache.

Transfer of Ethereum from one account to other react application.
**Resolution**: Since we have instantiated our web3 object using the Ethereum object created by Metamask. We were able to transfer ethers from the user’s account to hotelier’s account using the sent Transaction () function in eth object.
web3.eth.sendTransaction ({
        from: accounts [0],
        to: "0x7dBFE7C7F2ce06d7D914f3BB924EA327930a90C1",
        value: '5000000000000000000'
      })_
