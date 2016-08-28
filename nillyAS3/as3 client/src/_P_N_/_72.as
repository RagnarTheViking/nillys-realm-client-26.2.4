package _P_N_
{
   import _P_S_.Mediator;
   import _1F_z._0P_4;
   import _3b.CloseDialogsSignal;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.util.AnimatedLibrary;
   import com.company.assembleegameclient.util._Z_4;
   import com.company.assembleegameclient.util._18Q_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.display.BitmapData;
   import _0R_W_._0R_c;
   
   public class _72 extends Mediator
   {
       
      
      [Inject]
      public var view:_P_N_._0jy;
      
      [Inject]
      public var _0xI_:_0P_4;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      public function _72()
      {
         super();
      }
      
      override public function initialize() : void
      {
         var _loc1_:Bitmap = this._1tV_();
         this.view.init(_loc1_);
         this.view.closed.add(this._qN_);
      }
      
      private function _qN_() : void
      {
         this._0dR_.dispatch();
      }
      
      private function _1tV_() : Bitmap
      {
         var _loc1_:String = ObjectLibrary._M_(this.view.skinType);
         var _loc2_:XML = ObjectLibrary._0W_b(_loc1_);
         var _loc3_:String = _loc2_.AnimatedTexture.File;
         var _loc4_:int = _loc2_.AnimatedTexture.Index;
         var _loc5_:_Z_4 = AnimatedLibrary._0B_e(_loc3_,_loc4_);
         var _loc6_:_18Q_ = _loc5_.imageFromAngle(0,_Z_4._M_J_,0);
         var _loc7_:BitmapData = TextureRedrawer.resize(_loc6_.image_,_loc6_.mask_,160,true,0,0);
         _loc7_ = _0R_c._1iY_(_loc7_,0,6);
         return new Bitmap(_loc7_);
      }
   }
}
