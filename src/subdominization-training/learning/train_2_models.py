#!/usr/bin/python

from itertools import count
from subdominization.learn import LearnRules

import os
import sys
import argparse
from sklearn.utils.random import sample_without_replacement

from shutil import copy
import helpers
from sys import version_info



def create_model_dir(model_folder, yes_to_all, is_python_3=True):
    if (not os.path.isdir(model_folder)): # create output folder if does not exist
        if (not yes_to_all):
            if (is_python_3):
                response = input("create output folder \"%s\"? Y/n" % model_folder)
            else:
                response = input("create output folder \"%s\"? Y/n" % model_folder)
        if (yes_to_all or not response in ["no", "No", "NO", "n", "N"]):
            os.makedirs(model_folder)

        else:
            print("ERROR: output folder does not exist")
            sys.exit(1)

def create_model_files(model_file, yes_to_all, is_python_3=True):
    if (os.path.isfile(model_file)): # query the user if overwrite file
        if (not yes_to_all and overwrite_existing_files == None):
            if (is_python_3):
                response = input("overwrite existing model files? y/N")
            else:
                response = input("overwrite existing model files? y/N")
            if (not response in ["no", "No", "NO", "n", "N"]):
                overwrite_existing_files = True
            else:
                overwrite_existing_files = False
        if (yes_to_all or overwrite_existing_files):
            os.remove(model_file)
        else:
            print("file already exists", model_file)
            sys.exit(1)


def train_model(both_models_folder, model_type, keep_duplicate_features, mean_over_duplicates, yes_to_all=False):
    # copy relevant_rules files to model_folder


    count_folder = os.path.join(both_models_folder, "count")
    binary_folder = os.path.join(both_models_folder, "binary")

    create_model_dir(os.path.join(count_folder,"models"), yes_to_all)
    create_model_dir(os.path.join(binary_folder,"models"), yes_to_all)


    binary_relevant_rules = os.path.join(binary_folder, "relevant_rules")
    count_relevant_rules = os.path.join(count_folder, "relevant_rules")

    if (os.path.isfile(binary_relevant_rules)):
        copy(binary_relevant_rules, both_models_folder)
    else:
        print("WARNING: no \"relevant_rules\" file in training folder")

    if (os.path.isfile(binary_relevant_rules)):
        copy(binary_relevant_rules, both_models_folder)
    else:
        print("WARNING: no \"relevant_rules\" file in training folder")
    
    overwrite_existing_files = None
    
    # split the current training folder


    # generate models and save to file
    for binary_file, count_file in zip(os.listdir(binary_folder), os.listdir(count_folder)):
        assert binary_file == count_file

        curr_bin_file = os.path.join(binary_folder, binary_file)
        curr_count_file = os.path.join(count_folder, count_file)
        
        bin_model_file = None
        count_model_file = None

        if (os.path.isfile(curr_bin_file) and (binary_file.endswith(".csv") or binary_file.endswith(".csv.bz2"))):
            name_bin = binary_file[:-4] + ".bin_model" if binary_file.endswith(".csv") else binary_file[:-8]
            bin_model_file = os.path.join(binary_folder, name_bin)
            
            name_count = count_file[:-4] + ".count_model" if count_file.endswith(".csv") else count_file[:-8]
            count_model_file = os.path.join(count_folder, name_count)
            

            
            # Get the indicies based on the data we loaded and then pass the data to the models
            # the two parameters are remove_duplicate_features and tax_max_for_duplicates
            dataset_bin = helpers.get_dataset_from_csv(curr_bin_file, keep_duplicate_features, mean_over_duplicates)
            dataset_count = helpers.get_dataset_from_csv(curr_count_file, keep_duplicate_features, mean_over_duplicates)
            assert len(dataset_bin) == len(dataset_count)

            # robie tak zeby podawac X_train, X_test itp z miejsca tutaj a nie zebym tam dzielic
            
            # train_bin = dataset_bin.iloc[train_indicies]
            # train_count = dataset_count.iloc[train_indicies]
            # test_bin = dataset_bin.drop(train_indicies)
            # test_count = dataset_count.drop(train_indicies)
            
            # X_bin, y_bin = dataset_bin.iloc[:,:-1], list(dataset_bin.iloc[:, -1])
            # X_count, y_count = dataset_count.iloc[:,:-1], list(dataset_count.iloc[:, -1])

            # number_of_samples = len(dataset_bin)
            # train_indicies = sample_without_replacement(number_of_samples, number_of_samples//5)
            # train_indicies = sample_without_replacement(len(dataset_bin), 5)


            learned_model_bin = LearnRules(training_file=curr_bin_file, modelType=model_type, njobs=1, remove_duplicate_features=not keep_duplicate_features, take_max_for_duplicates=not mean_over_duplicates)
            learned_model_count = LearnRules(training_file=curr_count_file, modelType=model_type, njobs=1, remove_duplicate_features=not keep_duplicate_features, take_max_for_duplicates=not mean_over_duplicates)
            print("#################### BINARY MODEL ####################")
            print("training model from file ", curr_bin_file)
            if (not learned_model_bin.is_empty):
                print("writing model to file ", bin_model_file, "")
                learned_model_bin.saveToDisk(bin_model_file)
                print(" .. done")
                learned_model_bin.printStats()

            print("#################### COUNT MODEL ####################")
            print("training model from file ", curr_count_file)

            if (not learned_model_count.is_empty):
                print("writing model to file ", count_model_file, "")
                learned_model_count.saveToDisk(count_model_file)
                print(" .. done")
                learned_model_count.printStats()
            else:
                raise Exception("Count model didnt learn anything")
            input('evaluated 2 models')
            print()
    

# def train_wrapper(model, lab_configs):
#     training_set_folder = "../caldera/training-data/goodops-useful-num10k/training/"
#     model_folder_prefix = "../caldera/trained-models/goodops-useful-num10k-test/trained_model_"
        
#     CLASSIFIERS = set(["LOGR", "LOGRCV", "RF", "SVCCV", "SVC", "DT", "KNN", "KRNCV_RG"])        
        
#     print("Training %s model" % model)
#     if (not model in CLASSIFIERS): # is regressor
#         train_model(model_folder_prefix + model.lower() + "_aggmean/", training_set_folder, model, False, True, True)
#         lab_configs.append(model.lower() + "_aggmean/")
#         train_model(model_folder_prefix + model.lower() + "_aggmax/", training_set_folder, model, False, False, True)
#         lab_configs.append(model.lower() + "_aggmax/")
#     else:
#         train_model(model_folder_prefix + model.lower() + "/", training_set_folder, model, False, False, True)
#         lab_configs.append(model.lower() + "/")
#     print()



if __name__ == "__main__":
    argparser = argparse.ArgumentParser()
    argparser.add_argument("--manual", action="store_true", required=False, help="adapt options in script directly")
    
    argparser.add_argument("--both-models-folder", type=str, required=False, help="path to the two model folders")
    argparser.add_argument("--model-folder", type=str, required=False, help="path to folder where to store model files in")
    argparser.add_argument("--model-type", type=str, required=False, help="the type of the learning model: can be one of 'LRCV', 'LG', 'RF' , 'SVMCV','NBB', 'NBG', 'DT'")
    argparser.add_argument("--keep-duplicate-features", action="store_true", required=False, help="elimination and aggregation of duplicate feature vectors, default is eliminate")
    argparser.add_argument("--mean-over-duplicates", action="store_true", required=False, help="aggregating eliminated duplicate feature vectors by taking max or mean (default is max)")
    
    args = argparser.parse_args()
    
    if (not args.manual):
        if (not args.both_models_folder or not args.model_type):
            print("INPUT ERROR: the following two options need to be provided: --both-models-folder --model-type")
            sys.exit(1)
        args.keep_duplicate_features = True
        train_model(args.both_models_folder, args.model_type, args.keep_duplicate_features, args.mean_over_duplicates)
    else:
        # possible models (still not a complete list): ["LOGR", "LINR", "RF", "SVC", "SVR", "DT", "DT_RG", "DTGD_RG", "KNN", "KNN_R", "RF_RG", "RFGD_RG", "SVCCV", "SVRGD", "KRNCV_RG", "KRN_RG"]
        
        models = ["LOGR", "SVC", "LINR", "SVR", "DT", "DT_RG", "KRN_RG"]
        
        lab_configs = []
        
        for model in models:
            train_wrapper(model, lab_configs)
            
        print(lab_configs)

    
    
            
            
