import request from '@/utils/request'

export function getDrugList(params) {
  return request({
    url: '/drug/findAll',
    method: 'get',
    params
  })
}

export function  delById(params){
  return request({
    url: '/drug/delById',
    method: 'get',
    params
  })
}

export function  addDrug(drug){
  return request({
    url: '/drug/addDrug',
    method: 'post',
   data:drug
  })
}

export function  editDrug(drug){
  return request({
    url: '/drug/editDrug',
    method: 'post',
    data:drug
  })
}
