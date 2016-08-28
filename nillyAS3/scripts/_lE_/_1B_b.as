package _lE_
{
   import _ge._v1;
   import _0E_T_._1zi;
   import kabam.rotmg.assets.services._0pW_;
   import Packets.Client.Reskin;
   import com.company.assembleegameclient.objects.Player;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   
   public class _1B_b
   {
       
      
      [Inject]
      public var model:_v1;
      
      [Inject]
      public var classes:_1zi;
      
      [Inject]
      public var factory:_0pW_;
      
      public function _1B_b()
      {
         super();
      }
      
      public function execute(param1:Reskin) : void
      {
         var _loc2_:Player = null;
         var _loc3_:int = 0;
         var _loc4_:_0ih = null;
         _loc2_ = param1.player || this.model.player;
         _loc3_ = param1.skinID;
         _loc4_ = this.classes._0B_M_(_loc2_.objectType_);
         var _loc5_:_Y_F_ = _loc4_._E_G_._nV_(_loc3_);
         _loc2_.skin = this.factory._0wx(_loc5_._0C_3);
         _loc2_._08X_ = false;
      }
   }
}
