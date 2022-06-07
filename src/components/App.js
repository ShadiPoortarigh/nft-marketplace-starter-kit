
import React,{Component} from "react";
import Web3 from "web3";
import detectEthereumProvider from "@metamask/detect-provider";
import Greenbox from '../abis/Greenbox.json';
import { MDBCard, MDBCardBody, MDBCardTitle, MDBCardText, MDBCardImage, MDBBtn } from "mdb-react-ui-kit";
import './App.css';

class App extends Component{
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

                                <form onSubmit="">
                                    <input type="text" placeholder="Add file location" className="form-control mb-1" ref={(input)=>this.Greenbox=input>}>

                                    <input type="submit" style={{margin:'6'px}}
                                </form>

                            </div>
                        </main>
                    </div>
                </div>
            </div>
        )
    }
}

export default App


