import request from '@/utils/request'

export function getSex4ECharts(params) {
  return request({
    url: '/setup/employ/sex',
    method: 'get',
    params
  })
}
