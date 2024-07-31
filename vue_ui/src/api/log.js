import request from '@/utils/request'

export function getfindAll(params) {
  return request({ //查全部，单位编码模糊查询，单位名字模糊查询
    url: '/log/findAll',
    method: 'get',
    params
  })
}

export function delLog(id) {
  return request({
    url: '/log/delLog',
    method: 'get',
    params:{
      id
    }
  })
}
