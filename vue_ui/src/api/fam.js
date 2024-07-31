import axios from '@/utils/request'

export function getFamilyList(params) {
  return axios({
    url: '/patient/family/list',
    method: 'get',
    params
  })
}
export function deleteById(params) {
  return axios({
    url: '/patient/family/del',
    method: 'get',
    params
  })
}
export function addFamily(data) {
  return axios({
    url: '/patient/family/add',
    method: 'post',
    data
  })
}
export function editFamily(data) {
  return axios({
    url: '/patient/family/update',
    method: 'post',
    data
  })
}
