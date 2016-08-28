package _05g
{
   import _P_S_.Mediator;
   import _W_Q_.TitleBasicAccountInfo;
   import _4u.Account;
   import _v4.Client;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import _0J_8._0C_M_;
   import _0T_b._1fd;
   import _00I_.KabamAccountInfoView;
   import _0u4.KongregateAccountInfoView;
   import _1dw._0aU_;
   import _0y._0T_W_;
   import _1N_W_._0D_Q_;
   import _y0.Kong;
   import _1R_9._0Z_x;
   import ToolTips.ToolTip;
   
   public class _0T_Z_ extends Mediator
   {
       
      
      [Inject]
      public var view:TitleBasicAccountInfo;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var client:Client;
      
      [Inject]
      public var _Z_v:_q6;
      
      [Inject]
      public var _0w6:_1K_2;
      
      public function _0T_Z_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.tooltip.add(this._0S_f);
         this.view.drawRank(this.client.getNumStars(),this.client.getRank(),this.client.isAdmin());
         this.view.drawGuild(this.client.getGuildName(),this.client.getGuildRank());
         this.view._0V_T_(this._0S_0());
      }
      
      private function _0S_0() : _0C_M_
      {
         var _loc1_:_0C_M_ = null;
         switch(this.account._L_y())
         {
            case _0T_W_._1R_H_:
               _loc1_ = new _1fd(this.client.getName());
               break;
            case _0D_Q_._1R_H_:
               _loc1_ = new KabamAccountInfoView();
               break;
            case Kong._1R_H_:
               _loc1_ = new KongregateAccountInfoView();
               break;
            case _0Z_x._1R_H_:
               _loc1_ = new _0aU_();
         }
         return _loc1_;
      }
      
      override public function destroy() : void
      {
         this.view.tooltip.remove(this._0S_f);
         this._0w6.dispatch();
      }
      
      private function _0S_f(param1:ToolTip) : void
      {
         this._Z_v.dispatch(param1);
      }
   }
}
