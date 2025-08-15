import { Link, NavLink } from 'react-router-dom'
import logo from '../assets/BlueModernTechnologyLogo-removebg-preview.png';

export default function Header() {
    return (
        <header className="site-header">
            <div
                className="container"
                style={{
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    padding: '14px 0'
                }}
            >
                <div
                    className="brand"
                    style={{ display: 'flex', alignItems: 'center', gap: '4px' }}
                >
                    <Link
                        to="/"
                        style={{ color: 'inherit', textDecoration: 'none', display: 'flex', alignItems: 'center' }}
                    >
                        <img
                            src={logo}
                            alt="FreeCodeVeda Logo"
                            style={{ height: '90px', width: 'auto' }}
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


