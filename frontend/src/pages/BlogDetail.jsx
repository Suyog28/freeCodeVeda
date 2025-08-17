import { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { getJson } from '../lib/api'

export default function BlogDetail() {
    const { id } = useParams()
    const [blog, setBlog] = useState(null)
    useEffect(() => { getJson(`/api/blogs/${id}`).then(setBlog) }, [id])
    if (!blog) return <div className="container page"><p>Loading...</p></div>
    return (
        <div className="container page">
            <h1>{blog.title}</h1>
            <div style={{ color: '#9fb0d0', marginBottom: 12 }}>{blog.publishedAt}</div>
            <p>{blog.content}</p>
        </div>
    )
}


