const BASE = import.meta.env.VITE_API_URL || (import.meta.env.DEV ? 'http://localhost:3000' : '')

export async function getJson(path) {
    const res = await fetch(BASE + path)
    if (!res.ok) throw new Error('Request failed')
    return res.json()
}

export async function postJson(path, body) {
    const res = await fetch(BASE + path, { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) })
    if (!res.ok) throw new Error('Request failed')
    return res.json()
}

