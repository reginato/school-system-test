module Api
    module V1
      class CreditCardsController < ApiBaseController
  
        private
  
          def credit_card_params
            case action_name
              when 'create'
                # add , :document ?
                params.require(:credit_card).permit(:pan, \
                  :first_name, :last_name, :brand, \
                  :expiration_month, :expiration_year, :cvc, \
                  :country, :state, :city, :zip_code, :district, \
                  :street, :numbesr, :complement, :phone
                ).merge({
                    user_id: @current_user.id
                  })
              when 'update'
                params.require(:credit_card).permit( \
                  :country, :state, :city, :zip_code, :district, \
                  :street, :number, :complement, :phone
                )
            end
          end
  
          def query_params
            {}
          end
  
      end
    end
  end