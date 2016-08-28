package _F_0
{
   import _P_S_.Mediator;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _wi.Injector;
   import _S_b._O_e;
   import _7h._1Y_D_;
   import _7h._1a8;
   import _3b.DialogSignalNoDim;
   import _0wX_._L_I_;
   import _T_n._1gJ_;
   import Packets.PacketManagerBase;
   import _T_J_.GTween;
   import _0E_Z_._0W_y;
   import flash.events.TimerEvent;
   import Packets.Server.QuestFetchResponse;
   import Packets.Server.QuestRedeemResponse;
   import _1O_R_.Dialog;
   import _P_N_.FancyDialog;
   import flash.events.Event;
   import _0H_6.GameContext;
   import flash.events.MouseEvent;
   
   public class _kp extends Mediator
   {
       
      
      [Inject]
      public var container:_F_0._1O_0;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _K_Q_:_1Y_D_;
      
      [Inject]
      public var _0F_e:_1a8;
      
      [Inject]
      public var _Y_Q_:DialogSignalNoDim;
      
      public var _G_V_:int = -1;
      
      public var _C_1:_L_I_;
      
      public var _0mz:_1gJ_;
      
      public var _7R_:PacketManagerBase;
      
      private var view:_F_0.TinkerView;
      
      private var _A_p:_F_0.TinkerView;
      
      private var _H_L_:Boolean = false;
      
      public function _kp()
      {
         super();
      }
      
      override public function initialize() : void
      {
         if(this.container.parent == null)
         {
            return;
         }
         var _loc1_:Number = 0.2;
         if(this.view != null && this.view.parent != null)
         {
            this._gI_();
            this._A_p = this.view;
            this.resetVars();
            new GTween(this._A_p,0.4,{"alpha":0});
            new _0W_y(0.4,this._1f5);
            _loc1_ = 0.4;
         }
         this.view = new _F_0.TinkerView();
         this.container.addChild(this.view);
         this.view.alpha = 0;
         new GTween(this.view,_loc1_,{"alpha":1});
         if(this._1tf != null && this._1tf._14O_ != null && this._1tf._14O_.gsc_ != null)
         {
            this._7R_ = this._1tf._14O_.gsc_;
            this._7R_.questFetch();
            this.view._ml(true);
         }
         else
         {
            this.view._1L_o();
         }
         this._K_Q_.add(this._0yT_);
         this._0F_e.add(this._07y);
         _F_0.TinkerView.closed.add(this._fH_);
      }
      
      private function _1gW_() : void
      {
         this._gI_();
         this.initialize();
      }
      
      private function _1f5() : void
      {
         if(this._A_p != null && this._A_p.parent != null)
         {
            this.container.removeChild(this._A_p);
         }
      }
      
      private function _fH_() : void
      {
         _F_0.TinkerView.closed.removeAll();
         this._gI_();
         this.closeDialogs.dispatch();
      }
      
      private function _09i(param1:TimerEvent) : void
      {
         if(Math.random() < 0.5)
         {
            this.view.init(1,3205,"AAAAAAHHH we are in need of this {goal} now. Help help help.","http://i.imgur.com/ceobPxd.png");
         }
         else
         {
            this.view.init(1,1793,"WOAAH we are in need of this {goal} now. Help help.","https://www.google.com/images/srpr/logo11w.png");
         }
      }
      
      private function _0yT_(param1:QuestFetchResponse) : void
      {
         this._G_V_ = int(param1.goal);
         var _loc2_:int = param1.tier;
         if(_loc2_ > 0)
         {
            this.view.init(int(param1.tier),this._G_V_,param1.description,param1.image);
            this._ls();
         }
         else if(_loc2_ == -1)
         {
            this.view._1L_o();
         }
         else
         {
            this.view._F_V_(param1.description);
         }
      }
      
      private function _07y(param1:QuestRedeemResponse) : void
      {
         var dialog:Dialog = null;
         var _arg1:QuestRedeemResponse = param1;
         var _local2:Boolean = Boolean(_arg1.ok);
         var _local3:String = String(_arg1.message);
         this._H_L_ = false;
         if(!_local2)
         {
            dialog = new FancyDialog("Error while tinkering item",_local3,"Ok",null,"/tinkerError");
            dialog.addEventListener(Dialog.LEFT_BUTTON,function(param1:Event):void
            {
               TinkerView.closed.dispatch();
            });
            GameContext.getInjector().getInstance(DialogSignal).dispatch(dialog);
            return;
         }
         if(this._0mz != null)
         {
            this._0mz.addEventListener(MouseEvent.CLICK,this._1S_j);
            this._0mz._1bF_();
            this._0mz._0D_S_("OK");
            this._0mz._00Y_(5526612);
            this._0mz.draw();
            this._C_1._8T_();
            this.view._0D_7();
         }
      }
      
      private function _ls() : void
      {
         this._C_1 = this.view._t3();
         this._0mz = this.view._dn();
         this._C_1._032.remove(this._D_b);
         this._C_1._032.add(this._D_b);
         this._C_1._1V_Y_.remove(this._0D_H_);
         this._C_1._1V_Y_.add(this._0D_H_);
         this._0mz.removeEventListener(MouseEvent.CLICK,this._U_e);
         this._0mz.removeEventListener(MouseEvent.CLICK,this._1S_j);
      }
      
      private function _gI_() : void
      {
         this._K_Q_.remove(this._0yT_);
         this._0F_e.remove(this._0yT_);
         if(this._C_1 != null)
         {
            this._C_1._032.remove(this._D_b);
            this._C_1._1V_Y_.remove(this._0D_H_);
         }
         if(this._0mz != null)
         {
            this._0mz.removeEventListener(MouseEvent.CLICK,this._U_e);
            this._0mz.removeEventListener(MouseEvent.CLICK,this._1S_j);
         }
      }
      
      private function resetVars() : void
      {
         this._G_V_ = -1;
         this._C_1 = null;
         this._0mz = null;
         this._G_V_ = -1;
         this._C_1 = null;
         this._0mz = null;
         this._7R_ = null;
      }
      
      override public function destroy() : void
      {
         this._gI_();
      }
      
      private function _D_b(param1:int) : void
      {
         if(this._C_1 != null && !this._H_L_)
         {
            if(param1 == this._G_V_)
            {
               this._0mz.addEventListener(MouseEvent.CLICK,this._U_e);
               this._C_1._1vP_(false);
               this._C_1._Z_0 = false;
               this._C_1.updateTitle();
            }
            else
            {
               this._C_1._1E_u();
               this._C_1._P_i();
               this._C_1._1vP_(true);
            }
         }
      }
      
      private function _0D_H_() : void
      {
      }
      
      private function _U_e(param1:MouseEvent) : void
      {
         if(this._7R_ != null)
         {
            this._0mz.removeEventListener(MouseEvent.CLICK,this._U_e);
            this._0mz._0D_S_("Tinkering");
            this._0mz._00Y_(5526612);
            this._0mz.draw();
            this._H_L_ = true;
            this._7R_.questRedeem(this._C_1.objectId,this._C_1.slotId,this._C_1.itemId);
            this.view._U_e();
         }
      }
      
      private function _1S_j(param1:MouseEvent) : void
      {
         this.initialize();
      }
   }
}
