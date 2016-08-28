package _E_o
{
   import _P_S_.Mediator;
   import _0Z_1._1K_b;
   import _v4._f0;
   import _1F_z._0P_4;
   import com.company.assembleegameclient.objects._1kF_;
   import com.company.assembleegameclient.objects.Pet;
   
   public class _1js extends Mediator
   {
       
      
      [Inject]
      public var view:_1K_b;
      
      [Inject]
      public var _0X_p:_f0;
      
      [Inject]
      public var _0xI_:_0P_4;
      
      private var _0G_D_:_1kF_;
      
      public function _1js()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._G_0 = this._fV_;
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
      
      public function _fV_() : _1kF_
      {
         if(!this._0H_n())
         {
            return this._0X_p._0c8;
         }
         if(this._09P_())
         {
            this._0G_D_ = this._0X_p._0c8;
         }
         return this._0G_D_;
      }
      
      private function _09P_() : Boolean
      {
         return this._0X_p._0c8 is Pet?Boolean(this._0bl()):true;
      }
      
      private function _0bl() : Boolean
      {
         if(!this._0G_D_ && this._0H_n())
         {
            return true;
         }
         if(this._0G_D_ is Pet && this._0H_n() && Pet(this._0X_p._0c8)._W_d._0__5() != Pet(this._0G_D_)._W_d._0__5())
         {
            return true;
         }
         return false;
      }
      
      private function _0H_n() : Boolean
      {
         return this.view.gs_.map.isPetYard;
      }
   }
}
