import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { getJson, postJson } from '../lib/api'

export default function Home() {
    const [courses, setCourses] = useState([])
    const [status, setStatus] = useState('')

    useEffect(() => { getJson('/api/courses').then(setCourses).catch(() => setCourses([])) }, [])

    function onEnquire(e) {
        e.preventDefault()
        setStatus('Submitting...')
        const data = Object.fromEntries(new FormData(e.currentTarget).entries())
        postJson('/api/enquire', data)
            .then(() => setStatus('Thanks! We will reach out shortly.'))
            .catch(() => setStatus('Something went wrong.'))
    }

    return (
        <>
            <section className="hero">
                <div className="container hero-grid">
                    <div>
                        <h1>Best IT Training Institute in Pune</h1>
                        <p>Live project based training, mentorship, and placement support. Get job-ready skills in Software Testing, Full Stack, Data Science, Cloud and more.</p>
                        <div className="hero-cta">
                            <Link className="btn" to="/courses">Find Your Course</Link>
                            <Link className="btn secondary" to="/enroll">Request a Callback</Link>
                        </div>
                    </div>
                    <div className="card">
                        <h3>Enquire Now</h3>
                        <form onSubmit={onEnquire}>
                            <input name="name" placeholder="Name" required />
                            <input name="mobile" placeholder="Mobile No." required />
                            <input name="email" placeholder="Email" type="email" />
                            <select name="course" required>
                                <option value="">Choose Course</option>
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
                                <option>Pimple Saudagar</option>
                                <option>Erandwane</option>
                            </select>
                            <button type="submit" className="btn full">Enquire</button>
                            <p className="form-status">{status}</p>
                        </form>
                    </div>
                </div>
            </section>

            <section className="features container">
                <div className="feature">
                    <h3>Live project-based training</h3>
                    <p>Hands-on labs with real tools like Selenium, Postman, Git, and CI.</p>
                </div>
                <div className="feature">
                    <h3>100% Placement Assistance</h3>
                    <p>Resume, mock interviews, referrals, and job alerts.</p>
                </div>
                <div className="feature">
                    <h3>Continuous Mentorship</h3>
                    <p>Industry trainers guide you from basics to advanced.</p>
                </div>
            </section>

            <section className="container">
                <h2>Popular Courses</h2>
                <div className="cards">
                    {courses.slice(0, 6).map((c, i) => (
                        <div key={i} className="card">
                            <h3>{c.title}</h3>
                            <p>{c.shortDescription}</p>
                            <Link className="btn" to="/enroll">Enroll</Link>
                        </div>
                    ))}
                </div>
            </section>
        </>
    )
}


