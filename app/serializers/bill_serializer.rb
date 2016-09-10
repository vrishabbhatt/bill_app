class BillSerializer < ActiveModel::Serializer
  attributes :id , :bill_name , :bill_description
end
