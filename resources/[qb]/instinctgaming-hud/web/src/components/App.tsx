import React, {useState} from 'react';
import './App.css'
import {debugData} from "../utils/debugData";
import {useNuiEvent} from "../hooks/useNuiEvent";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faBottleWater,faBell, faBrain, faBurger, faDoorClosed, faDoorOpen, faExclamation, faGasPump, faHeadset, faHeart, faMicrophone, faShield, faUser, faUserSlash, faWalkieTalkie, faSkull } from '@fortawesome/free-solid-svg-icons'
import Badge from '@mui/material/Badge';
import Fade from '@mui/material/Fade';


debugData([
  {
    action: 'setVisible',
    data: true,
  }
])

const App: React.FC = () => {
  const [visible, setVisible] = useState(true)
  const [voiceLevel, setVoiceLevel] = useState(2)
  const [voiceActive, setVoiceActive] = useState(false)
  const [statusData, setStatusData] = useState({
    isTalking: false,
    hunger: 50,
    thirst: 50,
    stress: 0,
    health: 50,
    armor: 50,
    radioActive: false,
    isDead: false,
  })

  const [vehicleData, setVehicleData] = useState({
    show: false,
    speed: 20,
    fuel: 90,
    progBarActive: false,
    seatBelt: false,
    RPM: 20,
    inVehicle: false,
  })

  const [location, setLocation] = useState('East Joshua Rd')

  useNuiEvent<any>('setStatusData', setStatusData) 

  useNuiEvent<boolean>('setVisible', (data:any) => {
    setVisible(data)
  })

  useNuiEvent('cycleVoice', (data : number) => {
    setVoiceLevel(data)
  })

  useNuiEvent('updateVoice', (data : any) => {
    setVoiceActive(data)
  })

  useNuiEvent('updateCarHud', (data : any) => {
    setVehicleData(data)
  })

  useNuiEvent('setLocation', (data : any) => {
    setLocation(data)
  })

  const convertSpeed = (speed:any) => {
    if (Math.floor(speed) < 10 ) {
      return '00'+speed
    } else if (Math.floor(speed) < 100 ) {
      return '0'+speed
    } else {
      return speed
    }
  }

  const [actions,setActions] = useState(false)
  const [actCount, setActCount] = useState(0)

  useNuiEvent('setActionData', (data : any) => {
    setActions(data)
  })
  
  useNuiEvent('setActionCount', (data : any) => {
    console.log(data)
    setActCount(data)
  })

  const [doorData, setDoorData] = useState({
    show:false,
    locked:false
  })

  useNuiEvent('setDoorData', (data : any) => {
    setDoorData(data)
  })

  useNuiEvent('hideDoor', () => {
    setDoorData({show:false,locked:doorData.locked})
  })

  return (
    <div className="nui-wrapper">
      <div className='hud-wrapper' style={{left: vehicleData.inVehicle && !statusData.isDead ? '350px' : '35px'}}>
        <div className='main-hud'>

          <div className='side-hud'>
            <div className="box">
              <FontAwesomeIcon className='faIcon' icon={faBurger} />
              <div className="fill hunger" style={{height: `${statusData.hunger}%` }}></div>
            </div>
            <div className="box">
              <FontAwesomeIcon className='faIcon' icon={faBottleWater} />
              <div className="fill thirst" style={{height: `${statusData.thirst}%` }}></div>
            </div>
            <div className="box" style={{display: statusData.stress >= 1 ? '' : 'none'}}>
              <FontAwesomeIcon className='faIcon' icon={faBrain} />
              <div className="fill stress" style={{height: `${statusData.stress}%` }}></div>
            </div>
          </div>

          <div className='side-hud'>
            <div className="box">
              {!statusData.radioActive ? <FontAwesomeIcon className='faIcon' style={{color: statusData.isTalking ? statusData.radioActive ? '#686868' : '#8BC34A' : ''}} icon={faMicrophone} /> : <FontAwesomeIcon className='faIcon' style={{color: statusData.isTalking ? '#FFEB3B' : ''}} icon={faWalkieTalkie} />}
              <div className="fill voice" style={{height: voiceLevel === 1 ? '33%' : voiceLevel === 2 ? '66%' : '100%'}}></div>
            </div>
            {statusData.isDead ? <div className="box">
              <FontAwesomeIcon className='faIcon' icon={faSkull} />
              <div className="fill dead" style={{height: '100%' }}></div>
            </div> : <div className="box">
              <FontAwesomeIcon className='faIcon' icon={faHeart} />
              <div className="fill health" style={{height: `${statusData.health}%` }}></div>
            </div>}
            <div className="box" style={{display: statusData.armor > 0 ? '' : 'none'}}>
              <FontAwesomeIcon className='faIcon' icon={faShield} />
              <div className="fill armor" style={{height: `${statusData.armor}%` }}></div>
            </div>
          </div>
        </div>
      </div>

      <div className='car-hud-wrapper' style={{display: vehicleData.show && !statusData.isDead ? '' : 'none'}}>
        <div className="box">
          {vehicleData.seatBelt ? <FontAwesomeIcon className='faIcon' icon={faUser} /> : <FontAwesomeIcon style={{color:'#686868'}} className='faIcon' icon={faUserSlash} />}
          <div className="fill voice" style={{height: `0%` }}></div>
        </div>
        <div className="bigBox">
          <div className='speedText'>{vehicleData.speed}</div>
          <div className='mphText'>MPH</div>
          <div className="bigFill" style={{height: `${vehicleData.RPM}%`, background: `hsl(${100-vehicleData.RPM}, 53%, 40%)`  }}></div>
        </div>
        <div className="box">
          <FontAwesomeIcon className='faIcon' icon={faGasPump} />
          <div className="fill" style={{height: `${vehicleData.fuel}%`, backgroundColor: `hsl(${vehicleData.fuel}, 53%, 40%)`  }}></div>
        </div>
        
      </div>

      {location !== '' ? <div className='location'>{location}</div> : <div></div>}
    </div>
  );
}

export default App;

