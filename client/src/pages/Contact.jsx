export default function Contact() {
    function onSubmit(e) {
        e.preventDefault()
        const data = Object.fromEntries(new FormData(e.currentTarget).entries())
        fetch('/api/enquire', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(data) })
    }
    return (
        <div className="container page">
            <h1>Contact</h1>
            <div className="grid-2">
                <div>
                    <h3>Risod</h3>
                    <p>Netaji Niwas<br />+91-123456789<br />info@FreeCodeVeda.com</p>
                    <h3>Risod</h3>
                    <p>Maharashtra.<br />+91-123456789<br />info@FreeCodeVeda.com</p>
                </div>
                <div className="card">
                    <h3>Request a Call Back</h3>
                    <form onSubmit={onSubmit}>
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
                            <option>Risod</option>
                            <option>Pune</option>
                        </select>
                        <button type="submit" className="btn full">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    )
}
