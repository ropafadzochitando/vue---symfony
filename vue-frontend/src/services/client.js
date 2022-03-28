import axios from 'axios'
const host = 'http://127.0.0.1:8000/api' 
const apiClient = axios.create({
    baseURL: host,
})

export default apiClient