import csv
import json
# import unicodedata
import collections
import string

table = collections.defaultdict(lambda: None)
table.update({
    ord('á'): 'a',
    ord('é'): 'e',
    ord('í'): 'i',
    ord('ó'): 'o',
    ord('ú'): 'u',
    ord('Á'): 'A',
    ord('É'): 'E',
    ord('Í'): 'I',
    ord('Ó'): 'O',
    ord('Ú'): 'U',
    ord('ñ'): 'ñ',
    ord('Ñ'): 'Ñ',
    ord('ü'): 'ü',
    ord('Ü'): 'Ü',
    ord('.'): '.',
    ord("'"): "'",
    ord(' '): ' ',
    ord('\N{NO-BREAK SPACE}'): ' ',
    ord('\N{EN SPACE}'): ' ',
    ord('\N{EM SPACE}'): ' ',
    ord('\N{THREE-PER-EM SPACE}'): ' ',
    ord('\N{FOUR-PER-EM SPACE}'): ' ',
    ord('\N{SIX-PER-EM SPACE}'): ' ',
    ord('\N{FIGURE SPACE}'): ' ',
    ord('\N{PUNCTUATION SPACE}'): ' ',
    ord('\N{THIN SPACE}'): ' ',
    ord('\N{HAIR SPACE}'): ' ',
    ord('\N{ZERO WIDTH SPACE}'): ' ',
    ord('\N{NARROW NO-BREAK SPACE}'): ' ',
    ord('\N{MEDIUM MATHEMATICAL SPACE}'): ' ',
    ord('\N{IDEOGRAPHIC SPACE}'): ' ',
    ord('\N{IDEOGRAPHIC HALF FILL SPACE}'): ' ',
    ord('\N{ZERO WIDTH NO-BREAK SPACE}'): ' ',
    ord('\N{TAG SPACE}'): ' ',
    })
table.update(dict(zip(map(ord, string.ascii_uppercase), string.ascii_lowercase)))
table.update(dict(zip(map(ord, string.ascii_lowercase), string.ascii_lowercase)))
table.update(dict(zip(map(ord, string.digits), string.digits)))


def csv_to_json(csv_file_path, json_file_path):
    data_dict = {}
    with open(csv_file_path, encoding='utf-8') as csv_file_handler:
        csv_reader = csv.DictReader(csv_file_handler)
        for rows in csv_reader:
            # change all chars including ñ
            # prov = ''.join((c for c in unicodedata.normalize('NFD', rows['provincia']) if unicodedata.category(c) != 'Mn')).upper()
            # dpto = ''.join((c for c in unicodedata.normalize('NFD', rows['departamento']) if unicodedata.category(c) != 'Mn')).upper()
            prov = rows['provincia'].translate(table, ).upper()
            dpto = rows["departamento"].translate(table, ).upper()

            if prov not in data_dict:
                data_dict[prov] = {}
            data_dict[prov][dpto] = rows

    with open(json_file_path, 'w', encoding='utf-8') as json_file_handler:
        json_file_handler.write(json.dumps(data_dict, indent=4))


csv_file_path = "./proy_1025_depto_total.csv"
json_file_path = "./poblacion_por_departamento.json"
csv_to_json(csv_file_path, json_file_path)
