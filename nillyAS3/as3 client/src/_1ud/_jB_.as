package _1ud
{
   import Packets.Server.Death;
   import _v4.Client;
   import _1T_4._1yM_;
   import _0R_R_._1uC_;
   import _06s._F_d;
   import _0pN_._114;
   import _0Q_Q_._1oj;
   import _0Q_Q_._42;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import _0H_w._1P_e;
   import com.company.assembleegameclient.parameters.Parameters;
   import _0pN_._eg;
   import _0pN_._1my;
   
   public class _jB_
   {
       
      
      [Inject]
      public var death:Death;
      
      [Inject]
      public var player:Client;
      
      [Inject]
      public var _S_s:_1yM_;
      
      [Inject]
      public var _0pM_:_1uC_;
      
      [Inject]
      public var _M_i:_F_d;
      
      [Inject]
      public var _0rU_:_114;
      
      private var _1kp:_1oj;
      
      public function _jB_()
      {
         super();
      }
      
      public function execute() : void
      {
         this._1kp = new _42(this.death.accountId_,this.death.charId_);
         this._1X_i();
         this._137();
         this._vC_();
      }
      
      private function _1X_i() : void
      {
         var _loc1_:SavedCharacter = this.player._0qD_(this.death.charId_);
         var _loc2_:int = !!_loc1_?int(_loc1_.level()):0;
         var _loc3_:_1P_e = new _1P_e();
         _loc3_.category = "killedBy";
         _loc3_._19E_ = this.death.killedBy_;
         _loc3_.value = _loc2_;
         this._S_s.dispatch(_loc3_);
      }
      
      private function _137() : void
      {
         Parameters.data_.needsRandomRealm = false;
         Parameters.save();
      }
      
      private function _vC_() : void
      {
         if(this.player.getAccountId() == "")
         {
            this._13J_();
         }
         else
         {
            this._M_i.dispatch(this._1kp);
         }
      }
      
      private function _13J_() : void
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(this._0pM_);
         _loc1_.add(new _1my(this._M_i,this._1kp));
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
   }
}
