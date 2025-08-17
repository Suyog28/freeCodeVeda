import { Link, NavLink } from 'react-router-dom'
import codeveda2Logo from '../assets/codeveda2.png'

export default function Header() {
    return (
        <header className="site-header">
            <div className="container">
                <div className="brand">
                    <Link
                        to="/"
                        style={{ color: 'inherit', textDecoration: 'none', display: 'flex', alignItems: 'center' }}
                    >
                        <img
                            src={codeveda2Logo}
                            alt="CodeVeda2 Logo"
                        />
                        <span>FreeCodeVeda</span>
                    </Link>
                </div>
                <nav>
                    <NavLink to="/" end>Home</NavLink>
                    <NavLink to="/courses">Courses</NavLink>
                    <NavLink to="/batches">Batches</NavLink>
                    <NavLink to="/team">Team</NavLink>
                    <NavLink to="/blogs">Blog</NavLink>
                    <NavLink to="/contact">Contact</NavLink>
                </nav>
                <Link className="cta" to="/enroll">Enroll Now</Link>
            </div>
        </header>
    )
}


