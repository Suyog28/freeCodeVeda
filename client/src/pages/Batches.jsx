import { useEffect, useState } from 'react'
import { getJson } from '../lib/api'

export default function Batches() {
    const [batches, setBatches] = useState([])
    useEffect(() => { getJson('/api/batches').then(setBatches) }, [])
    return (
        <div className="container page">
            <h1>Upcoming & Ongoing Batches</h1>
            <table className="table">
                <thead>
                    <tr>
                        <th>Course</th>
                        <th>Batch Date</th>
                        <th>Mode</th>
                        <th>Time</th>
                        <th>Duration</th>
                        <th>Branch</th>
                    </tr>
                </thead>
                <tbody>
                    {batches.map((b, i) => (
                        <tr key={i}>
                            <td>{b.course}</td>
                            <td>{b.batchDate}</td>
                            <td>{b.mode}</td>
                            <td>{b.time}</td>
                            <td>{b.duration}</td>
                            <td>{b.branch}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}


