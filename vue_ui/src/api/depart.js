import request from '@/utils/request'

export function getDepartmentsList(params) {
  return request({
    url: '/setup/depart/list',
    method: 'get',
    params
  })
}
export function deleteById(params) {
  return request({
    url: '/setup/depart/del',
    method: 'get',
    params
  })
}
export function addDepartments(data) {
  return request({
    url: '/setup/depart/add',
    method: 'post',
    data
  })
}
export function editDepartments(data) {
  return request({
    url: '/setup/depart/update',
    method: 'post',
    data
  })
}
