import request from '@/utils/request'
export function getappointments(params) {
  return request({ //查全部，分页
    url: 'appointment/findAll',
    method: 'get',
    params
  })
}
export function delById(params) {
  return request({ //删
    url: 'appointment/delById',
    method: 'get',
    params
  })
}
export function update(appointmentsVO) {
  return request({ //改
    url: 'appointment/update',
    method: 'post',
    data:appointmentsVO
  })
}
