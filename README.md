# hotel-booking-blockchain
This Application is a decentralized application implemented to perform hotel reservations privately using Blockchain technology.


Blockchain, the foundation of the bitcoin and the future of the payment technology. It received a great attention in the recent times both in academic and administration. The trust-free, tamper-evident, and cryptographic security structure of blockchain technology enables digitizing fiat currencies, creating smart contracts, developing decentralized autonomous organizations, and many more applications. Governments, corporations, and other organizations have already started to develop blockchain platforms to test and potentially integrate the technology into mainstream use. The aim of the project ‘Hotel reservations Blockchain’ is based on how the secure transactions are made with transparency between the customers and the business using the Blockchain and cryptocurrency. 

What is block chain?
Blockchain is one of the recent technologies of the digital age. As per many market gurus, after the computer and Internet, blockchain is the next best thing that can happen to the world. It is true that this technology is still in its nascent stage. But the potential uses of the blockchain are yet to be explored. Blockchain has all the abilities to fundamentally alter the way in which information is recorded and accessed. Business enterprises are allocating more resources to research and incorporate this technology in day-to-day business operations.
The Basics: 
The function of blockchain technology is still unknown to many people. This awe-inspiring technology is built on a simplistic design. Blockchain tech is a list of digital records or a public ledger where transactions are recorded and stored. All the information is stored anonymously and is secured using cryptographic ciphers. Every record or transaction is saved in an individual block. In other words, with every new transaction, a new block is added to the network and linked to the previous blocks in the form of a chain – hence the name, blockchain. Each new transaction in the network has to be authorized or validated by the users in the network.
Blockchain is a decentralized network. In other words, all the information stored in the network can be accessed by any node connected to the network. This provides a greater level of transparency and a higher security in the network. Thus, it is the simplistic design of this tech that makes the blockchain network tamper-proof. Additionally, each block also records the time and date when the record was created. The timestamp feature makes it convenient to trace any data in the network. Due to this, many blockchain application development companies are in demand. 

Pain point:
In the traditional transaction system, there is much chances of fraudulency and no transparency of demand created by the business. For an instance, the hotel business makes an interest of flexibly by refreshing the phony accessibility of the rooms over the sites and pushing the clients to snatch the proposal before request increments.

Why is the traditional manner not good enough?
There's always a risk of identity theft, since a buyer must often disclose personal information to complete a transaction. The headlines frequently feature news of legitimate businesses experiencing cyber-attacks that expose sensitive customer information. There's often no way for a buyer to be sure that transaction privacy and data encryption systems offered by retailers are as robust as billed. The current accounting system depends on the double-entry bookkeeping to provide internal control and heavily relies on both internal and external audits to build trust between stakeholders (i.e., suppliers, financial institutions, and governments). 

Why is the problem important?
Traditional payment systems require the consumer to either send paper checks by mail or require them to physically come over and sign papers before performing a transaction. There is a lack of security. This is because the consumer has to send all confidential data on a paper, which is not encrypted, that may be read by anyone. There is a lack of coverage. When we talk in terms of current businesses, they span many countries or states. These businesses need faster transactions. This is not possible without the bank having branches near all of the company offices. There is a lack of eligibility because not all potential buyers may have a bank account. And finally, there is a lack of support for micro-transactions. Many transactions done on the internet are of very low cost though they involve data flow between two entities in two countries. The same, if done on paper, may not be feasible at all.

Tools and languages:
To overcome the difficulties faced in the above scenarios. The current project can be useful to resolve the hotel reservation payment issues.

The tools and languages used in this project are: 
Backend tools: Remix IDE for solidity programming, npm and truffle to compile and immigrate.
Front tools: React, Truffle, Metamask, web3.js Library, Smart contract, Ganache.

Use case Diagram:
The use case diagram is a representation of a user’s interaction with system that shows the relationship between the user and the different use cases in which the user is involved.

[image](https://user-images.githubusercontent.com/41775443/113839176-7247e880-975d-11eb-8e4f-fd5517994df3.png)



Who is user?
The user here is the customer who is using the blockchain transactions over traditional payments.
What are the functions that your application support?
View profile: The client can open the site and experience profile
User Login: The user can enter his credentials and become an authenticated user. They are a security measure designed to prevent unauthorized access to confidential data
Check room availability: The approved user can experience the rooms left/consumed.
												
Make Booking: The user can make booking of an available room.

Make Payment: The user can finish the booking by causing secure installment and will to get an affirmation.

Cancel Booking: The client can drop the booking if a bit much and get the refund back.


Step by step explanation:

What is the functionality? 
 The functionality of the application is, the user can use an application that uses blockchain as a secure transaction medium to reserve a room in a hotel. The application via blockchain show the real time IOT (internet of things) of rooms left/occupied in a particular location which helps the customer to know the availability without subjecting to the fraudulence.  Once the transaction is approved the user receives a confirmation receipt without subjecting any falsie acts.
Implementation steps
Create a project using truffle 

      npm install truffle
     Truffle unbox react


The above command will create the following directory structure

[image](https://user-images.githubusercontent.com/41775443/113839545-c521a000-975d-11eb-9cb9-38f7130bfeae.png)

The client directory contains the frontend code 
Write solidity contract code and deploy it on ganache
Install Ganache and create a workspace
[image](https://user-images.githubusercontent.com/41775443/113839996-395c4380-975e-11eb-83d4-afd1901c9be4.png)


Install Metamask chrome extension and link the private blockchain(ganashe) with metamask


Write front end code. 
Use web3 js to integrate all the components, (private blockchain, frontend application, metamask)


How does it look?
The final output of the Customer UI is below:
[image](https://user-images.githubusercontent.com/41775443/113840925-357cf100-975f-11eb-8516-6d38b394af8b.png)

Encountered Issues
Faced connectivity issues from Ganache, Truffle and React.
Resolution: By Setting the network in Metamask to custom blockchain created by Ganache, Metamask wallet is able to connect to the private block chain which we are going to use for developing our smart contract.
In our font end we are checking if the browser’s window object has Ethereum object in it. Using this Ethereum object we are able to instantiate our web3 instance.

Contract ABI & contract address had to be manual pasted in React application.
Resolution: To instantiate the contract object which is inside our web3 instance, we have to provide our deployed smart contract’s address and contract’s abi (Application Binary Interface)
So by reading the complete contract .json file we were able to provide the contract abi and contract address as arguments to instantiate the Contract object. Using this Contract object we were able to execute the Smart Contract’s functions which are deployed on our private block chain created by Ganache.

Transfer of Ethereum from one account to other react application.
Resolution: Since we have instantiated our web3 object using the Ethereum object created by Metamask. We were able to transfer ethers from the user’s account to hotelier’s account using the sent Transaction () function in eth object.
web3.eth.sendTransaction ({
        from: accounts [0],
        to: "0x7dBFE7C7F2ce06d7D914f3BB924EA327930a90C1",
        value: '5000000000000000000'
      })_
