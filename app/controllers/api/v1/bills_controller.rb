class Api::V1::BillsController < Api::V1::BaseController
	
	def show
		bill = Bill.find(params[:id])
		render(json: Api::V1::BillSerializer.new(bill).to_json)
	end

	def index
		bills = Bill.all
		render(
			json:
			ActiveModel::ArraySerializer.new(
        	bills,
        	each_serializer: Api::V1::BillSerializer ,
        	root: 'bills',
			))
	end

	def create
		bill = Bill.new(create_params)
		bill.save
		render(
			json: Api::V1::BillSerializer.new(bill).to_json
			)
	end

	def update
		bill = Bill.find(params[:id])
		bill.update(create_params)
	end

	def destroy
		bill = Bill.find(params[:id])
		bill.destroy!

	end

	private
		def create_params
			params.require(:bill).permit(:bill_name , :bill_description)
		end
end
