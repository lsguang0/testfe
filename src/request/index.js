import axios from "axios";
// import { ElMessage } from 'element-plus';

const http = axios.create({
    baseURL: 'http://42.192.53.215:8010/api',
    timeout: 10000
})

http.interceptors.request.use((config) => {
    const token = localStorage.getItem('token')
    if (token) {
        // 请求头携带token
        config.headers.Authorization = 'Bearer ' + token;
    }
    return config;
}, (error) => {
    return Promise.reject(error);
});

http.interceptors.response.use((res) => {
    console.log(res, 'res');
    // 状态码为 2xx 范围时都会调用该函数，处理响应数据
    if (res.status === 200) {
        const data = res.data;
        return Promise.resolve(data);
    }
}, (error) => {


});


export default http;
