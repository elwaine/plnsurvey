import React from 'react';
import Image from 'next/image';
import Logo from '../assets/Logo.png'; 
import Tiang from '../assets/tiang.png';

function Login() {
  return (
  <>
<div className="flex h-screen">
  <div className="flex-1 bg-gradient-to-b from-cyan-500 to-cyan-200 flex items-center justify-center relative ">
    <div className="absolute bottom-0 left-0 transform -translate-x-16">
      <div className="relative h-[600px] w-[600px]">
        <Image src={Tiang} alt="Tiang" layout="fill" objectFit="contain"  />
      </div>
    </div>
  </div>

  <div className="flex-1 bg-white flex items-center justify-center  ">
  <div className="w-full max-w-md px-6 ">
    <div className="text-left mb-6">
      <Image src={Logo} alt="Logo PLN Survey" width={200} className="mb-4" />
    </div>


    <h2 className=" font-bold text-2xl mb-4 text-cyan-400">
      Masuk untuk memulai <span className="block text-cyan-600">Survey</span>
    </h2>
    <hr className="border-cyan-400 border-2 rounded  mb-6" />


    <form>
      <div className="mb-4">
        <label
          htmlFor="nip"
          className="block text-cyan-600 font-semibold text-sm mb-2"
        >
          NIP
        </label>
        <input
          id="nip"
          type="text"
          placeholder="Masukkan NIP Anda"
          className="w-full border-cyan-600 border-2 rounded-2xl p-3 focus:outline-none text-sm "
        />
      </div>
      <div className="mb-6">
        <label
          htmlFor="password"
          className=" block text-cyan-700 font-semibold text-sm mb-2"
        >
          Password
        </label>
        <input
          id="password"
          type="password"
          placeholder="Masukkan Password Anda"
          className=" text-sm w-full border-cyan-600 border-2 rounded-2xl p-3 focus:outline-none mb-3"
        />
      </div>
      <button
  type="submit"
  className="  w-11/12 bg-cyan-400 text-white rounded-2xl py-3 font-bold hover:bg-cyan-300 transition mx-5 text-sm"
>
  Masuk
</button>

    </form>
  </div>
</div>

</div>


  </>
  );
}

export default Login;
