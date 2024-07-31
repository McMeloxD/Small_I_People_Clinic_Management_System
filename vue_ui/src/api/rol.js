import request from '@/utils/request'

export function getRolesList(params) {
  return request({
    url: '/setup/roles/list',
    method: 'get',
    params
  })
}
export function deleteById(params) {
  return request({
    url: '/setup/roles/del',
    method: 'get',
    params
  })
}
export function addRoles(data) {
  return request({
    url: '/setup/roles/add',
    method: 'post',
    data
  })
}
export function editRoles(data) {
  return request({
    url: '/setup/roles/update',
    method: 'post',
    data
  })
}
