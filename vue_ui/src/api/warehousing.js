import request from '@/utils/request'

export function getList(params) {
  return request({
    url: '/warehousing/getList',
    method: 'get',
    params
  })
}

export function  delById(params){
  return request({
    url: '/warehousing/delById',
    method: 'get',
    params
  })
}
