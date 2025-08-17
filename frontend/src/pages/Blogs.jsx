import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { getJson } from '../lib/api'

export default function Blogs() {
    const [blogs, setBlogs] = useState([])
    useEffect(() => { getJson('/api/blogs').then(setBlogs) }, [])
    return (
        <div className="container page">
            <h1>Blog</h1>
            <div className="cards">
                {blogs.map(b => (
                    <div className="card" key={b.id}>
                        <h3>{b.title}</h3>
                        <p>{b.excerpt}</p>
                        <Link className="btn" to={`/blog/${b.id}`}>Read More</Link>
                    </div>
                ))}
            </div>
        </div>
    )
}


