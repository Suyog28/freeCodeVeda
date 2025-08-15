import { useEffect, useState } from 'react'
import { getJson } from '../lib/api'

export default function Team() {
    const [team, setTeam] = useState([])
    useEffect(() => { getJson('/api/team').then(setTeam) }, [])
    return (
        <div className="container page">
            <h1>Our Team</h1>
            <div className="cards">
                {team.map((m, i) => (
                    <div className="card" key={i}>
                        <h3>{m.name}</h3>
                        <div style={{ color: '#9fb0d0' }}>{m.role}</div>
                        <p>{m.bio}</p>
                    </div>
                ))}
            </div>
        </div>
    )
}


