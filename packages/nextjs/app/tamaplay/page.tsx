"use client";

import type { NextPage } from "next";
import { MouseEventHandler } from "react";
import { useAccount } from "wagmi";

import {
  useDeployedContractInfo,
  useScaffoldContractRead,
  useScaffoldContractWrite,
} from "~~/hooks/scaffold-eth";

const Home: NextPage = () => {
  const { address: connectedAddress } = useAccount();

  const { data: tokenID } = useScaffoldContractRead({
    contractName: "Tama",
    functionName: "tokenOfOwnerByIndex",
    args: [connectedAddress, BigInt(0)],
  });

  const { data: gameData } = useScaffoldContractRead({
    contractName: "Tama",
    functionName: "gameData",
    args: [tokenID],
  });

  const handleStart: MouseEventHandler<HTMLButtonElement> = () => {
    return start();
  };

  const { writeAsync: start } = useScaffoldContractWrite({
    contractName: "Tama",
    functionName: "start",
    args: [tokenID],
  });

  const handleEat: MouseEventHandler<HTMLButtonElement> = () => {
    return eat();
  };

  const { writeAsync: eat } = useScaffoldContractWrite({
    contractName: "Tama",
    functionName: "eat",
    args: [tokenID],
  });


  const handlePlay: MouseEventHandler<HTMLButtonElement> = () => {
    return play();
  };

  const { writeAsync: play } = useScaffoldContractWrite({
    contractName: "Tama",
    functionName: "play",
    args: [tokenID],
  });

  const { data: tamaContractData } = useDeployedContractInfo("Tama");

  const handleApproveTamaFood: MouseEventHandler<HTMLButtonElement> = () => {
    return approveTamaFood();
  };

  const { writeAsync: approveTamaFood } = useScaffoldContractWrite({
    contractName: "TamaFood",
    functionName: "approve",
    args: [tamaContractData?.address, BigInt(500000000000000000000)]
  });

  function goHome(){
    window.location.href = '/';
  }

  function goTamafoodmint(){
    window.location.href = 'tamafoodmint';
  }

  const startTime = gameData ? gameData[1] : 0;

  return (
    <>
        <div className="flex items-center flex-col flex-grow pt-10">
        {!connectedAddress &&
          <h1 className="text-4xl font-bold text-gray-900">CONNECT YOUR WALLET &</h1>
        }
        <h1 className="text-4xl font-bold text-gray-900">PLAY WITH TAMA</h1>
            <div className="flex justify-center items-center gap-12 flex-col sm:flex-row">
                    <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
                        <div className="p-5">
                            <button className="btn btn-primary" onClick={handleStart} disabled={!connectedAddress || startTime != BigInt(0)}>
                                OPEN EGG 🔨
                            </button>
                        </div>
                    </div>
                    
                    <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
                        <div className="p-5">
                            <button className="btn btn-primary" onClick={handlePlay} disabled={startTime == BigInt(0)}>
                                LET IT PLAY 🛝
                            </button>
                        </div>
                    </div>

                    <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
                        <div className="p-5">
                            <button className="btn btn-primary" onClick={handleApproveTamaFood} disabled={startTime == BigInt(0)}>
                                GIVE IT MONEY 💵
                            </button>
                        </div>
                    </div>

                    <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
                        <div className="p-5">
                            <button className="btn btn-primary" onClick={handleEat} disabled={startTime == BigInt(0)}>
                                LET IT EAT 🍴
                            </button>
                        </div>
                    </div>
               
            </div>
        </div> 

        <div className="flex-grow bg-base-300 w-full mt-16 px-8 py-12">
            <div className="flex justify-center items-center gap-12 flex-col sm:flex-row">
                <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
                🍇🍍🍌🍗🥩🥕
                <p>
                    <strong>MINT TAMAFOOD</strong>
                    <br /><br />
                    <button className="btn btn-primary" onClick={goTamafoodmint}>
                    MINT NOW
                    </button>
                </p>
                </div>
                <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
                🖼️🎨🎭
                <p>
                    <strong>HOW IS IT GOING?</strong>
                    <br /><br />
                    <button className="btn" onClick={goHome}>
                    CHECK YOUR STATS
                    </button>
                </p>
                </div>
            </div>
        </div>
    </>
  );
};

export default Home;
