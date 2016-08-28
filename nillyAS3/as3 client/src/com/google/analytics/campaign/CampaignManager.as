package com.google.analytics.campaign
{
   import com.google.analytics.utils.URL;
   import com.google.analytics.utils.Protocols;
   import com.google.analytics.v4.Configuration;
   import com.google.analytics.debug.DebugConfiguration;
   import com.google.analytics.core.Buffer;
   import com.google.analytics.debug.VisualDebugMode;
   import com.google.analytics.utils.Variables;
   import com.google.analytics.core.OrganicReferrer;
   
   public class CampaignManager
   {
      
      public static const trackingDelimiter:String = "|";
       
      
      private var _config:Configuration;
      
      private var _domainHash:Number;
      
      private var _debug:DebugConfiguration;
      
      private var _timeStamp:Number;
      
      private var _referrer:String;
      
      private var _buffer:Buffer;
      
      public function CampaignManager(param1:Configuration, param2:DebugConfiguration, param3:Buffer, param4:Number, param5:String, param6:Number)
      {
         super();
         this._config = param1;
         this._debug = param2;
         this._buffer = param3;
         this._domainHash = param4;
         this._referrer = param5;
         this._timeStamp = param6;
      }
      
      public static function isInvalidReferrer(param1:String) : Boolean
      {
         var _loc2_:URL = null;
         if(param1 == "" || param1 == "-" || param1 == "0")
         {
            return true;
         }
         if(param1.indexOf("://") > -1)
         {
            _loc2_ = new URL(param1);
            if(_loc2_.protocol == Protocols.file || _loc2_.protocol == Protocols.none)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function isFromGoogleCSE(param1:String, param2:Configuration) : Boolean
      {
         var _loc3_:URL = new URL(param1);
         if(_loc3_.hostName.indexOf(param2.google) > -1)
         {
            if(_loc3_.search.indexOf(param2.googleSearchParam + "=") > -1)
            {
               if(_loc3_.path == "/" + param2.googleCsePath)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function getCampaignInformation(param1:String, param2:Boolean) : CampaignInfo
      {
         var _loc3_:CampaignTracker = null;
         var _loc4_:CampaignTracker = null;
         var _loc5_:int = 0;
         var _loc7_:* = false;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc6_:CampaignInfo = new CampaignInfo();
         if(this._config.allowLinker && this._buffer.isGenuine())
         {
            if(!this._buffer.hasUTMZ())
            {
               return _loc6_;
            }
         }
         _loc3_ = this.getTrackerFromSearchString(param1);
         if(this.isValid(_loc3_))
         {
            _loc8_ = this.hasNoOverride(param1);
            if(_loc8_ && !this._buffer.hasUTMZ())
            {
               return _loc6_;
            }
         }
         if(!this.isValid(_loc3_))
         {
            _loc3_ = this.getOrganicCampaign();
            if(!this._buffer.hasUTMZ() && this.isIgnoredKeyword(_loc3_))
            {
               return _loc6_;
            }
         }
         if(!this.isValid(_loc3_) && param2)
         {
            _loc3_ = this.getReferrerCampaign();
            if(!this._buffer.hasUTMZ() && this.isIgnoredReferral(_loc3_))
            {
               return _loc6_;
            }
         }
         if(!this.isValid(_loc3_))
         {
            if(!this._buffer.hasUTMZ() && param2)
            {
               _loc3_ = this.getDirectCampaign();
            }
         }
         if(!this.isValid(_loc3_))
         {
            return _loc6_;
         }
         if(this._buffer.hasUTMZ() && !this._buffer.utmz.isEmpty())
         {
            _loc4_ = new CampaignTracker();
            _loc4_.fromTrackerString(this._buffer.utmz.campaignTracking);
            _loc7_ = _loc4_.toTrackerString() == _loc3_.toTrackerString();
            _loc9_ = this._buffer.utmz.responseCount;
         }
         if(!_loc7_ || param2)
         {
            _loc5_ = this._buffer.utma.sessionCount;
            _loc9_++;
            if(_loc5_ == 0)
            {
               _loc5_ = 1;
            }
            this._buffer.utmz.domainHash = this._domainHash;
            this._buffer.utmz.campaignCreation = this._timeStamp;
            this._buffer.utmz.campaignSessions = _loc5_;
            this._buffer.utmz.responseCount = _loc9_;
            this._buffer.utmz.campaignTracking = _loc3_.toTrackerString();
            this._debug.info(this._buffer.utmz.toString(),VisualDebugMode.geek);
            _loc6_ = new CampaignInfo(false,true);
         }
         else
         {
            _loc6_ = new CampaignInfo(false,false);
         }
         return _loc6_;
      }
      
      public function hasNoOverride(param1:String) : Boolean
      {
         var _loc2_:CampaignKey = this._config.campaignKey;
         if(param1 == "")
         {
            return false;
         }
         var _loc3_:Variables = new Variables(param1);
         var _loc4_:* = "";
         if(_loc3_.hasOwnProperty(_loc2_.UCNO))
         {
            _loc4_ = _loc3_[_loc2_.UCNO];
            switch(_loc4_)
            {
               case "1":
                  return true;
               case "":
               case "0":
               default:
                  return false;
            }
         }
         else
         {
            return false;
         }
      }
      
      public function getTrackerFromSearchString(param1:String) : CampaignTracker
      {
         var _loc2_:CampaignTracker = this.getOrganicCampaign();
         var _loc3_:CampaignTracker = new CampaignTracker();
         var _loc4_:CampaignKey = this._config.campaignKey;
         if(param1 == "")
         {
            return _loc3_;
         }
         var _loc5_:Variables = new Variables(param1);
         if(_loc5_.hasOwnProperty(_loc4_.UCID))
         {
            _loc3_.id = _loc5_[_loc4_.UCID];
         }
         if(_loc5_.hasOwnProperty(_loc4_.UCSR))
         {
            _loc3_.source = _loc5_[_loc4_.UCSR];
         }
         if(_loc5_.hasOwnProperty(_loc4_.UGCLID))
         {
            _loc3_.clickId = _loc5_[_loc4_.UGCLID];
         }
         if(_loc5_.hasOwnProperty(_loc4_.UCCN))
         {
            _loc3_.name = _loc5_[_loc4_.UCCN];
         }
         else
         {
            _loc3_.name = "(not set)";
         }
         if(_loc5_.hasOwnProperty(_loc4_.UCMD))
         {
            _loc3_.medium = _loc5_[_loc4_.UCMD];
         }
         else
         {
            _loc3_.medium = "(not set)";
         }
         if(_loc5_.hasOwnProperty(_loc4_.UCTR))
         {
            _loc3_.term = _loc5_[_loc4_.UCTR];
         }
         else if(_loc2_ && _loc2_.term != "")
         {
            _loc3_.term = _loc2_.term;
         }
         if(_loc5_.hasOwnProperty(_loc4_.UCCT))
         {
            _loc3_.content = _loc5_[_loc4_.UCCT];
         }
         return _loc3_;
      }
      
      public function getOrganicCampaign() : CampaignTracker
      {
         var _loc1_:CampaignTracker = null;
         var _loc2_:Array = null;
         var _loc3_:OrganicReferrer = null;
         var _loc4_:String = null;
         if(isInvalidReferrer(this._referrer) || isFromGoogleCSE(this._referrer,this._config))
         {
            return _loc1_;
         }
         var _loc5_:URL = new URL(this._referrer);
         var _loc6_:* = "";
         if(_loc5_.hostName != "")
         {
            if(_loc5_.hostName.indexOf(".") > -1)
            {
               _loc2_ = _loc5_.hostName.split(".");
               switch(_loc2_.length)
               {
                  case 2:
                     _loc6_ = _loc2_[0];
                     break;
                  case 3:
                     _loc6_ = _loc2_[1];
               }
            }
         }
         if(this._config.organic.match(_loc6_))
         {
            _loc3_ = this._config.organic.getReferrerByName(_loc6_);
            _loc4_ = this._config.organic.getKeywordValue(_loc3_,_loc5_.search);
            _loc1_ = new CampaignTracker();
            _loc1_.source = _loc3_.engine;
            _loc1_.name = "(organic)";
            _loc1_.medium = "organic";
            _loc1_.term = _loc4_;
         }
         return _loc1_;
      }
      
      public function getDirectCampaign() : CampaignTracker
      {
         var _loc1_:CampaignTracker = new CampaignTracker();
         _loc1_.source = "(direct)";
         _loc1_.name = "(direct)";
         _loc1_.medium = "(none)";
         return _loc1_;
      }
      
      public function isIgnoredKeyword(param1:CampaignTracker) : Boolean
      {
         if(param1 && param1.medium == "organic")
         {
            return this._config.organic.isIgnoredKeyword(param1.term);
         }
         return false;
      }
      
      public function isIgnoredReferral(param1:CampaignTracker) : Boolean
      {
         if(param1 && param1.medium == "referral")
         {
            return this._config.organic.isIgnoredReferral(param1.source);
         }
         return false;
      }
      
      public function isValid(param1:CampaignTracker) : Boolean
      {
         if(param1 && param1.isValid())
         {
            return true;
         }
         return false;
      }
      
      public function getReferrerCampaign() : CampaignTracker
      {
         var _loc1_:CampaignTracker = null;
         if(isInvalidReferrer(this._referrer) || isFromGoogleCSE(this._referrer,this._config))
         {
            return _loc1_;
         }
         var _loc2_:URL = new URL(this._referrer);
         var _loc3_:String = _loc2_.hostName;
         var _loc4_:String = _loc2_.path;
         if(_loc3_.indexOf("www.") == 0)
         {
            _loc3_ = _loc3_.substr(4);
         }
         _loc1_ = new CampaignTracker();
         _loc1_.source = _loc3_;
         _loc1_.name = "(referral)";
         _loc1_.medium = "referral";
         _loc1_.content = _loc4_;
         return _loc1_;
      }
   }
}
