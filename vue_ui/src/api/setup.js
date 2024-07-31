import request from '@/utils/request'

export function getEmployeesList(params) {
  return request({ //查全部，单位编码模糊查询，单位名字模糊查询
    url: '/setup/employ/list',
    method: 'get',
    params
  })
}
export function deleteById(params) {
  return request({ //删除员工
    url: '/setup/employ/del',
    method: 'get',
    params
  })
}
export function addEmployees(data) {
  return request({ //添加员工
    url: '/setup/employ/add',
    method: 'post',
    data
  })
}
export function editEmployees(data) {
  return request({ //编辑员工信息
    url: '/setup/employ/update',
    method: 'post',
    data
  })
}
