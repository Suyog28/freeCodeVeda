import { Link } from 'react-router-dom'

export default function Footer() {
    return (
        <footer className="site-footer">
            <div className="container footer-grid">
                <div>
                    <div className="brand">FreeCodeVeda</div>
                    <p>Risod<br />+91-9876543210| info@FreeCodeVeda.com</p>
                </div>
                <nav style={{ display: 'flex', gap: 12, alignItems: 'start' }}>
                    <Link to="/">Home</Link>
                    <Link to="/courses">Courses</Link>
                    <Link to="/batches">Batches</Link>
                    <Link to="/team">Team</Link>
                    <Link to="/contact">Contact</Link>
                </nav>
            </div>
            <div className="copyright">© 2025 FreeCodeVeda</div>
        </footer>
    )
}


