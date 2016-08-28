package _E_X_
{
   import _0f.IMediator;
   import _S_b._O_e;
   import _0O_N_._1uf;
   import _0Q_j._0R_C_;
   import _0Q_j._Q_O_;
   import _0Q_j._mG_;
   import _K_r._1V_v;
   import _0jo._1E_1;
   import _0E_n._jE_;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.utils.Dictionary;
   import _148._1zw;
   import _S_b._Q_e;
   import com.company.assembleegameclient.objects.Player;
   
   public class _du implements IMediator
   {
       
      
      [Inject]
      public var view:_E_X_._0I_Y_;
      
      [Inject]
      public var model:_O_e;
      
      [Inject]
      public var setFocus:_1uf;
      
      [Inject]
      public var _0Z_5:_0R_C_;
      
      [Inject]
      public var _dF_:_Q_O_;
      
      [Inject]
      public var _1i8:_mG_;
      
      [Inject]
      public var _E_:_1V_v;
      
      [Inject]
      public var _S_J_:_1E_1;
      
      [Inject]
      public var _H_u:_jE_;
      
      public function _du()
      {
         super();
      }
      
      public function initialize() : void
      {
         this.view.setMap(this.model._14O_.map);
         this.setFocus.add(this._1N_t);
         this._E_.add(this._E_5);
         this._dF_.add(this._0ho);
         this._0Z_5.add(this._1ck);
         this._1i8.add(this._0yW_);
         this._S_J_.add(this._1P_E_);
         this.view._pn = this._H_u.top;
      }
      
      private function _1P_E_() : void
      {
         this.view.deactivate();
      }
      
      public function destroy() : void
      {
         this.setFocus.remove(this._1N_t);
         this._E_.remove(this._E_5);
         this._dF_.remove(this._0ho);
         this._0Z_5.remove(this._1ck);
         this._1i8.remove(this._0yW_);
         this._S_J_.remove(this._1P_E_);
      }
      
      private function _1N_t(param1:String) : void
      {
         var _loc2_:GameObject = this._1H_6(param1);
         this.view.setFocus(_loc2_);
      }
      
      private function _1H_6(param1:String) : GameObject
      {
         var _loc2_:GameObject = null;
         if(param1 == "")
         {
            return this.view.map.player_;
         }
         var _loc3_:Dictionary = this.view.map.goDict_;
         for each(_loc2_ in _loc3_)
         {
            if(_loc2_.name_ == param1)
            {
               return _loc2_;
            }
         }
         return this.view.map.player_;
      }
      
      private function _1ck(param1:_1zw) : void
      {
         this.view.setGroundTile(param1._lU_,param1._1oA_,param1._1B_r);
      }
      
      private function _0ho(param1:_Q_e) : void
      {
         this.view.setGameObjectTile(param1._lU_,param1._1oA_,param1._1kA_);
      }
      
      private function _0yW_(param1:String) : void
      {
         if(param1 == _mG_.IN)
         {
            this.view.zoomIn();
         }
         else if(param1 == _mG_.OUT)
         {
            this.view.zoomOut();
         }
      }
      
      private function _E_5(param1:Player) : void
      {
         this.view.draw();
      }
   }
}
