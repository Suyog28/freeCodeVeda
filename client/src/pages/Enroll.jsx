import { useState } from 'react'

export default function Enroll() {
    const [status, setStatus] = useState('')
    function onSubmit(e) {
        e.preventDefault()
        const data = Object.fromEntries(new FormData(e.currentTarget).entries())
        setStatus('Submitting...')
        fetch('/api/register', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(data) })
            .then(r => r.ok ? r.json() : Promise.reject())
            .then(() => setStatus('Thanks! We will reach out shortly.'))
            .catch(() => setStatus('Something went wrong.'))
    }
    return (
        <div className="container page">
            <h1>Enroll</h1>
            <div className="card">
                <form onSubmit={onSubmit}>
                    <input name="name" placeholder="Name" required />
                    <input name="mobile" placeholder="Mobile No." required />
                    <input name="email" placeholder="Email" type="email" />
                    <select name="course" required>
                        <option value="">Course Looking For</option>
                        <option>Software Testing (Java Selenium)</option>
                        <option>Automation Testing (Python Selenium)</option>
                        <option>Java Full Stack Development</option>
                        <option>REST API Testing</option>
                        <option>.Net Full Stack Development</option>
                        <option>Diploma in UI/UX Development</option>
                        <option>React JS Development</option>
                        <option>Other</option>
                    </select>
                    <select name="branch" required>
                        <option value="">Choose Branch</option>
                        <option>Risod</option>
                        <option>Pune</option>
                    </select>
                    <button type="submit" className="btn full">Submit</button>
                    <div className="form-status">{status}</div>
                </form>
            </div>
        </div>
    )
}
