package _A_4
{
   import _P_S_.Mediator;
   import flash.utils.Timer;
   import _0E_T_._1zi;
   import _v4.Client;
   import _1to._0I_;
   import kabam.rotmg.assets.services._0pW_;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   import flash.events.TimerEvent;
   import com.company.assembleegameclient.util.Star;
   import kabam.rotmg.assets.model.Animation;
   
   public class _D_c extends Mediator
   {
       
      
      private const _E_G_:Object = new Object();
      
      private const _06y:Timer = new Timer(250,1);
      
      [Inject]
      public var view:_A_4.ClassDetailView;
      
      [Inject]
      public var _0ta:_1zi;
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var _1R_:_0I_;
      
      [Inject]
      public var factory:_0pW_;
      
      private var character:_0ih;
      
      private var _19Z_:_Y_F_;
      
      public function _D_c()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.character = this._0ta._1H_j();
         this._06y.addEventListener(TimerEvent.TIMER,this._Q_6);
         this._1R_.add(this._13i);
         this._0S_T_();
         this._13i();
      }
      
      override public function destroy() : void
      {
         this._1R_.remove(this._13i);
         this._06y.removeEventListener(TimerEvent.TIMER,this._Q_6);
         this.view._1k4(null);
         this._4r();
      }
      
      private function _0S_T_() : void
      {
         var _loc1_:int = this._0U_H_.charList._1hK_(this.character.id);
         var _loc2_:int = Star.numStars(_loc1_);
         this.view._do(this.character.name,this.character.description,_loc2_,this._0U_H_.charList.bestLevel(this.character.id),_loc1_);
         var _loc3_:int = Star.nextStarFame(_loc1_,0);
         this.view._a0(this.character.name,_loc3_);
      }
      
      private function _13i(param1:_Y_F_ = null) : void
      {
         param1 = param1 || this.character._E_G_._0sr();
         this._19Z_ = param1;
         this._06y.start();
      }
      
      private function _Q_6(param1:TimerEvent) : void
      {
         var _loc2_:Animation = this._E_G_[this._19Z_.id] = this._E_G_[this._19Z_.id] || this.factory._1iy(this._19Z_._0C_3,200);
         this.view._1k4(_loc2_);
      }
      
      private function _4r() : void
      {
         var _loc1_:* = null;
         var _loc2_:Animation = null;
         for(_loc1_ in this._E_G_)
         {
            _loc2_ = this._E_G_[_loc1_];
            _loc2_.dispose();
            delete this._E_G_[_loc1_];
         }
      }
   }
}
