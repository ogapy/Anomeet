module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # identified_byはコネクション(クライアントとサーバー間の関係を成立させる基礎)を識別するキーです。
    identified_by :current_user

    def connect
      # 下記のコードは、WebSocket接続が開いている場合は閉じ、404を返します。
      reject_authorized_connection unless find_verified_user
    end
    
    private

      def find_verified_user
        # 下記のコードで、ログインしているユーザーの情報を取得できます。
        self.current_user = env['warden'].user
      end
  end
end
