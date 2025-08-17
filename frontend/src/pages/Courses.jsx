import { useEffect, useState } from 'react'
import { getJson } from '../lib/api'

export default function Courses() {
    const [courses, setCourses] = useState([])
    useEffect(() => { getJson('/api/courses').then(setCourses) }, [])
    return (
        <div className="container page">
            <h1>Courses</h1>
            <div className="cards">
                {courses.map((c, i) => (
                    <div className="card" key={i}>
                        <h3>{c.title}</h3>
                        <p>{c.description || c.shortDescription}</p>
                        <div style={{ color: '#9fb0d0' }}>Duration: {c.duration || '—'}</div>
                    </div>
                ))}
            </div>
        </div>
    )
}


