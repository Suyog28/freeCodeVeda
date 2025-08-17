import { useEffect, useState } from 'react'

export default function Admin() {
    const [enquiries, setEnquiries] = useState([])
    const [registrations, setRegistrations] = useState([])
    useEffect(() => {
        fetch('/api/enquiries').then(r => r.json()).then(setEnquiries)
        fetch('/api/registrations').then(r => r.json()).then(setRegistrations)
    }, [])
    return (
        <div className="container page">
            <h1>Admin</h1>
            <h2>Enquiries</h2>
            <table className="table">
                <thead><tr><th>Name</th><th>Mobile</th><th>Email</th><th>Course</th><th>Branch</th><th>Created</th></tr></thead>
                <tbody>
                    {enquiries.map((e, i) => (
                        <tr key={i}><td>{e.name}</td><td>{e.mobile}</td><td>{e.email}</td><td>{e.course}</td><td>{e.branch}</td><td>{e.createdAt}</td></tr>
                    ))}
                </tbody>
            </table>

            <h2 style={{ marginTop: 24 }}>Registrations</h2>
            <table className="table">
                <thead><tr><th>Name</th><th>Mobile</th><th>Email</th><th>Course</th><th>Branch</th><th>Created</th></tr></thead>
                <tbody>
                    {registrations.map((r, i) => (
                        <tr key={i}><td>{r.name}</td><td>{r.mobile}</td><td>{r.email}</td><td>{r.course}</td><td>{r.branch}</td><td>{r.createdAt}</td></tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}

