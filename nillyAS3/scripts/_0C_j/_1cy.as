package _0C_j
{
   import _P_S_.Mediator;
   import _1y1._I_Y_;
   import _1y1._al;
   import _0pn._1R_l;
   import _166.Package;
   
   public class _1cy extends Mediator
   {
       
      
      [Inject]
      public var _0v9:_I_Y_;
      
      [Inject]
      public var view:_0C_j.PackageButton;
      
      [Inject]
      public var _F_D_:_al;
      
      [Inject]
      public var _0H_H_:_1R_l;
      
      private var _92:Package;
      
      private var _6o:Boolean;
      
      public function _1cy()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._F_D_._1gm.add(this._0M_w);
         this.view.clicked.add(this._1G_o);
         this.view.init();
         if(this._F_D_._0R_U_())
         {
            this._do();
         }
         else
         {
            this.view.visible = false;
            this._0v9.start();
         }
      }
      
      override public function destroy() : void
      {
         this.view.clicked.remove(this._1G_o);
         if(this._6o)
         {
            this._92.quantitySig.remove(this._00Q_);
            this._92.timeLeftSig.remove(this._0zR_);
            this._92._1gm.remove(this._0M_w);
         }
      }
      
      private function _0zR_(param1:int) : void
      {
         this.view._0Y_q(param1);
      }
      
      private function _00Q_(param1:int) : void
      {
         if(param1 <= 0)
         {
            this.view.visible = false;
         }
         else
         {
            this.view._9o(param1);
         }
      }
      
      private function _0M_w() : void
      {
         this.view.visible = true;
         this._do();
      }
      
      private function _do() : void
      {
         this._92 = this._F_D_._K_W_();
         this._6o = true;
         this._92.quantitySig.add(this._00Q_);
         this._92.timeLeftSig.add(this._0zR_);
         this.view._0Y_q(this._92.timeLeft());
         this.view._9o(this._92.quantity);
      }
      
      private function _1G_o() : void
      {
         this._0H_H_.dispatch(this._F_D_._K_W_().packageID);
      }
   }
}
