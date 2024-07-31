import axios from '@/utils/request'

export function getpList(params) {
  return axios({
    url: '/patient/pusher/plist',
    method: 'get',
    params
  })
}
export function deleteById(params) {
  return axios({
    url: '/patient/pusher/del',
    method: 'get',
    params
  })
}
export function addPatient(data) {
  return axios({
    url: '/patient/pusher/add',
    method: 'post',
    data
  })
}
export function editPatient(data) {
  return axios({
    url: '/patient/pusher/update',
    method: 'post',
    data
  })
}
