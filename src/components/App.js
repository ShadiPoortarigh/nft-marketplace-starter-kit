
import React,{Component} from "react";
import Web3 from "web3";
import detectEthereumProvider from "@metamask/detect-provider";
import Greenbox from '../abis/Greenbox.json';
import { MDBCard, MDBCardBody, MDBCardTitle, MDBCardText, MDBCardImage, MDBBtn } from "mdb-react-ui-kit";
import './App.css';

class App extends Component{

    // It allows us to execute React code when the component is already placed in the DOM
    async componentDidMount(){
        await this.loadWeb3();
        await this.loadBlockchainData();

    }

    // This function detects the presence of an ethereum provider in the web browser 
    async loadWeb3(){
        const provider = await detectEthereumProvider();

        if(provider){ //Authentication phase
            console.log('Ethereum Wallet Connected');
            window.web3 = new Web3(provider);
        }
        else{
            console.log('no ethereum wallet detected');

        }
    }

    // Then you must create a function that loads data from blockchain
    async loadBlockchainData(){
        const web3 = window.web3 //open a console
        const accounts = await web3.eth.getAccounts() // get the account
        this.setState({account:accounts[0]})

        const networkId = await web3.eth.net.getId() // get the id
        const networkData = Greenbox.networks[networkId] // using the id, get the data from Greenbox.json

        if(networkData){
            const abi = Greenbox.abi; // get the abi from Greenbox.json 
            const address = networkdata.address; // get the address from thr data inside Greenbox.json
            const contract = new web3.eth.Contract(abi, address); // create a contract using the data and its address
            this.setState({contract})

            const totalSupply = await contract.methods.totalSupply().call();
        this.setState({totalSupply})
        
        for (let i=1; i<=totalSupply; i++){
            const GreenBox = await contract.GreenBox(i-1).call()

            this.setState({GreenBox:[...this.state.GreenBox, GreenBox]});

        }


        
        }
        else{
            window.alert('Smart contract not deployed.')
        }

    }
    

    mint = (Greenbox)=>{
        this.state.contract.methods.mint(Greenbox).send({from:this.state.account}).once('recepit', (recepit)=>{
            this.setState({
                Greenbox:[...this.state.GreenBox, Greenbox]
            })
        })
    }
    


    constructor(props){
        super(props);
        this.state = {
            account:'',
            contract:null,
            totalSupply:0,
            Greenbox:[]
        }

    }


    render(){
        return(
            <div className = "container-filled">
                <nav className = "navbar navbar-dark  fixed-top bg-dark flex-md-nowrap p-0 shadow">
                    <div className ="navbar-brand col-sm-3 col-md-3 mr-0" style = {{color:'green'}}>
                        GreenBox NFTs
                    </div>
                    <ul className="navbar-nav px-3">
                        <li className="nav-item text-nowrap d-none d-sm-none d-sm-block">
                            <small className="text-while">
                                {this.state.account}
                            </small>
                        </li>
                    </ul>
                </nav>

                <div className="container-fluid mt-1">
                    <div className="row">
                        <main role='main' className="col-lg-12 d-flex text-center">
                            <div className="content mr-auto" style={{opecity:'0.8'}}>
                                <h1 style={{color:'black'}}>GreenBox NFT MarketPlace</h1>

                                <form 
                                onSubmit={(event)=>{
                                    event.preventDefault();
                                    const GreenBox = this.Greenbox.value;
                                    this.mint(Greenbox);
                                    }}
                                    >
                                    <input 
                                    type="text" 
                                    placeholder="Add file location" 
                                    className="form-control mb-1" 
                                    ref={(input)=>(this.Greenbox=input)}
                                    />

                                    <input type="submit" 
                                    style={{margin:'6px'}} 
                                    className='btn btn-primary btn-back' 
                                    value='MINT'
                                    />
                                </form>

                            </div>
                        </main>
                    </div>

                    <hr/><hr/>
                    <div className="row textCenter">
                        {this.state.GreenBox.map((GreenBox, key) => {
                            return(
                                <div>
                                    <div>
                                        <MDBCard className="token img" style={{maxWidth:'22rem'}}>
                                            <MDBCardImage src={GreenBox} position='top' height='250rem' style={{marginRight:'4px'}}/>
                                            <MDBCardBody>
                                                <MDBCardTitle>GreenBox</MDBCardTitle>
                                                <MDBCardText>The GreenBox NFT</MDBCardText>
                                                <MDBBtn href="{GreenBox}">Download</MDBBtn>
                                            </MDBCardBody>
                                        </MDBCard>
                                    </div>
                                </div>
                            )
                            
                        })}
                    </div>
                </div>
            </div>
        )
    }
}

export default App






//references for more study:

//https://www.dappuniversity.com/articles/how-to-build-a-blockchain-app#whatIsABlockchain

//https://docs.metamask.io/guide/ethereum-provider.html#chain-ids
